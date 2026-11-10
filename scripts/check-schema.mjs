import assert from 'node:assert/strict';
import { read, snapshot, files } from './lib/common.mjs';
import { parseCsv } from './lib/parse-csv.mjs';
import { mapType, tableName } from './lib/sqlserver.mjs';

// CSV expectations are independent of the generator implementation.
const header = ['dataset', 'column', 'position', 'type', 'size', 'primary_key',
  'foreign_key', 'references_dataset', 'references_column'];
const order = (a, b) => a < b ? -1 : a > b ? 1 : 0;
const key = (j) => [j.from, j.column, j.to, j.toColumn, j.kind].join('|');
const schema = await snapshot();
const datasets = [...schema.datasets].sort((a, b) => order(a.slug, b.slug));
const joins = [...schema.joins].sort((a, b) => order(key(a), key(b)));

async function checkCsv() {
  const all = [['area', ...header]];
  const catalog = [['name', 'slug', 'area', 'column_count', 'primary_key', 'source_article_url']];
  for (const d of datasets) {
    const area = schema.articles.find((a) => a.id === d.articleIds[0]);
    const expected = d.columns.map((c, i) => {
      const refs = joins.filter((j) => j.from === d.slug && j.column === c.name);
      return [d.name, c.name, String(i + 1), c.type, c.size, String(c.pk), String(c.fk),
        refs.map((j) => j.to).join(';'), refs.map((j) => j.toColumn).join(';')];
    });
    assert.deepEqual(parseCsv(await read(`csv/datasets/${d.slug}.csv`)), [header, ...expected], d.slug);
    all.push(...expected.map((row) => [area.name, ...row]));
    catalog.push([d.name, d.slug, area.name, String(d.columns.length), d.primaryKey.join(';'), area.url]);
  }
  assert.deepEqual(parseCsv(await read('csv/all-columns.csv')), all);
  assert.deepEqual(parseCsv(await read('csv/datasets.csv')), catalog);
  assert.deepEqual(parseCsv(await read('csv/joins.csv')), [
    ['from_dataset', 'from_column', 'to_dataset', 'to_column', 'kind'],
    ...joins.map((j) => [j.from, j.column, j.to, j.toColumn, j.kind])]);
  assert.equal(all.length-1, 1601);
  assert.equal(joins.length, 258);
}

async function checkUnresolved() {
  const unresolved = [...schema.unresolvedFks].sort((a, b) => order(`${a.dataset}|${a.column}`, `${b.dataset}|${b.column}`));
  const actual = parseCsv(await read('csv/unresolved-foreign-keys.csv'));
  assert.deepEqual(actual, [['dataset', 'column'], ...unresolved.map((u) => [u.dataset, u.column])]);
  for (const u of unresolved) {
    const d = datasets.find((d) => d.slug === u.dataset);
    assert.equal(d.columns.find((c) => c.name === u.column).fk, true);
    const row = parseCsv(await read(`csv/datasets/${d.slug}.csv`)).find((r) => r[1] === u.column);
    assert.equal(row[6], 'true');
    assert.equal(row[7], ''); assert.equal(row[8], '');
  }
  assert.equal(unresolved.length, 102);
}

async function checkSqlServer() {
  const dir = 'sql/sqlserver';
  assert.deepEqual((await files(dir)).sort(), [...datasets.map((d) => `${dir}/${d.slug}.sql`), `${dir}/all-tables.sql`].sort());
  const tables = new Set();
  const all = await read(`${dir}/all-tables.sql`);
  for (const d of datasets) {
    const rows = parseCsv(await read(`csv/datasets/${d.slug}.csv`)).slice(1);
    const table = tableName(d.name);
    assert(!tables.has(table.toLowerCase()), `Duplicate table name ${table}`);
    tables.add(table.toLowerCase());
    const sql = await read(`${dir}/${d.slug}.sql`);
    const m = /^DROP TABLE IF EXISTS \[dbo\]\.\[(\w+)\];\nCREATE TABLE \[dbo\]\.\[\1\] \(\n([\s\S]*?)\n\);$/m.exec(sql);
    assert(m && m[1] === table, `${d.slug}: table statement`);
    const expected = rows.map((r) => `    [${r[1]}] ${mapType(r[3], r[4]).sql} NULL`);
    assert.deepEqual(m[2].split('\n').map((l) => l.replace(/,$/, '')), expected, `${d.slug}: columns`);
    assert(!/\b(PRIMARY|FOREIGN|REFERENCES|CONSTRAINT|NOT NULL)\b/i.test(sql.replace(/^--.*$/gm, '')), `${d.slug}: no constraints`);
    assert(all.includes(m[0]), `${d.slug}: missing from all-tables.sql`);
  }
  assert.equal(tables.size, 144);
  assert.equal((all.match(/^CREATE TABLE /gm) || []).length, 144);
  assert.throws(() => mapType('geography', '8'), /Unknown type/);
  assert.throws(() => mapType('bigint', '4'), /Unknown size/);
}

assert.equal(datasets.length, 144);
assert.deepEqual((await files('csv/datasets')).sort(), datasets.map((d) => `csv/datasets/${d.slug}.csv`).sort());
assert.deepEqual(parseCsv('a,b\n"a,b","a""b"\n'), [['a', 'b'], ['a,b', 'a"b']]);
assert.throws(() => parseCsv('a\n"unfinished'));
await checkCsv();
await checkUnresolved();
await checkSqlServer();
console.log('Schema fidelity verified: 144 dataset CSVs, 1601 columns, 258 joins, 102 unresolved foreign keys, 144 SQL Server table scripts.');
