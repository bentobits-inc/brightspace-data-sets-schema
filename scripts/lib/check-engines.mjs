import assert from 'node:assert/strict';
import { files, read } from './common.mjs';
import { parseCsv } from './parse-csv.mjs';
import { tableName } from './sqlserver.mjs';
import { mapType, quoteIdentifier } from './engines.mjs';

const engineNames = ['postgres', 'snowflake', 'bigquery', 'databricks', 'duckdb'];

// These expectations are independent of the generation mappings.
export function expectedType(engine, type, size) {
  const types = {
    bigint: ['bigint', 'BIGINT', 'INT64', 'BIGINT', 'BIGINT'],
    int: ['integer', 'INT', 'INT64', 'INT', 'INTEGER'],
    smallint: ['smallint', 'SMALLINT', 'INT64', 'SMALLINT', 'SMALLINT'],
    bit: ['boolean', 'BOOLEAN', 'BOOL', 'BOOLEAN', 'BOOLEAN'],
    datetime2: ['timestamp', 'TIMESTAMP_NTZ', 'DATETIME', 'TIMESTAMP_NTZ', 'TIMESTAMP'],
    uniqueidentifier: ['uuid', 'VARCHAR(36)', 'STRING(36)', 'STRING', 'UUID'],
    float: size === '24' ? ['real', 'FLOAT', 'FLOAT64', 'FLOAT', 'REAL']
      : ['double precision', 'FLOAT', 'FLOAT64', 'DOUBLE', 'DOUBLE']
  };
  if (Object.hasOwn(types, type)) return types[type][engineNames.indexOf(engine)];
  if (type === 'decimal') {
    const [p, s] = size.split(',').map(Number);
    const kind = { postgres: 'numeric', snowflake: 'NUMBER', databricks: 'DECIMAL', duckdb: 'DECIMAL',
      bigquery: s <= 9 && p-s <= 29 ? 'NUMERIC' : 'BIGNUMERIC' }[engine];
    return `${kind}(${p},${s})`;
  }
  assert(['nvarchar', 'varchar'].includes(type), `Unexpected source type ${type}`);
  return { postgres: `varchar(${size})`, snowflake: `VARCHAR(${size})`, bigquery: `STRING(${size})`,
    databricks: 'STRING', duckdb: 'VARCHAR' }[engine];
}

function expectedQuote(engine, name) {
  if (engine === 'bigquery') return '`' + name.replace(/\\/g, '\\\\').replace(/`/g, '\\`') + '`';
  if (engine === 'databricks') return '`' + name.replace(/`/g, '``') + '`';
  return '"' + name.replace(/"/g, '""') + '"';
}

const executable = (text) => text.split('\n').filter((l) => l.trim() && !l.startsWith('--')).join('\n');

function statement(engine, table, rows) {
  const columns = rows.map((r) => `    ${expectedQuote(engine, r[1])} ${expectedType(engine, r[3], r[4])}`);
  return `CREATE TABLE IF NOT EXISTS ${expectedQuote(engine, table)} (\n${columns.join(',\n')}\n);`;
}

function checkText(text, expected) {
  assert(!text.includes('\r'), 'SQL must use LF');
  const code = executable(text);
  assert(!/\b(DROP|REPLACE|TRUNCATE|DELETE|ALTER|INSERT|PRIMARY|FOREIGN|UNIQUE|CHECK|CONSTRAINT|REFERENCES)\b|\bNOT NULL\b/i.test(code),
    'Unexpected constraint or destructive keyword');
  // Exact equality enforces the complete grammar, quoting, column order and statement count.
  assert.equal(code, expected, 'SQL must contain exactly the expected statements');
}

function checkComments(text, dataset, schema) {
  const actual = text.split('\n').filter((l) => /^-- (Primary key|Join) /.test(l));
  const joins = schema.joins.filter((j) => j.from === dataset.slug).sort((a, b) => {
    const key = (j) => `${j.column}|${j.to}|${j.toColumn}`;
    return key(a) < key(b) ? -1 : key(a) > key(b) ? 1 : 0;
  });
  const expected = [`-- Primary key (informational, not enforced): ${dataset.primaryKey.join(', ')}`,
    ...joins.map((j) => `-- Join (informational): ${j.column} -> ${tableName(schema.datasets.find((d) => d.slug === j.to).name)}.${j.toColumn}`)];
  assert.deepEqual(actual, expected, 'Keys and joins must be comments only');
}

function checkInvalidText(engine) {
  const good = statement(engine, 'Sample', [['Sample', 'Id', '1', 'bigint', '8']]);
  const q = expectedQuote(engine, 'Id');
  const altered = good.replace(`    ${q} ${expectedType(engine, 'bigint', '8')}`, `    ${q} DECIMAL(3,0)`);
  const invalid = [good + '\nSELECT 1;', good + '\nDROP TABLE Sample;',
    good.replace(`    ${q}`, `    ${q} UNIQUE`), altered, good.replace(q, q.slice(1))];
  for (const text of invalid) {
    assert.throws(() => checkText(text, good));
    assert.throws(() => checkText(good + '\n' + text, good + '\n' + good));
  }
  checkText(good, good);
}

function checkMappingEdges(engine) {
  assert.throws(() => mapType(engine, 'geography', '8'), /Unknown type/);
  assert.throws(() => mapType(engine, 'bigint', '4'), /Unknown size/);
  for (const size of ['0,0', '39,0', '38,39', '1,2', '2,-1', '2,1.5', 'bad']) {
    assert.throws(() => mapType(engine, 'decimal', size), /decimal/);
  }
  for (const size of ['0', '-1', 'no', '99999999999999999999']) {
    assert.throws(() => mapType(engine, 'nvarchar', size), /size/);
  }
  for (const size of ['1,0', '38,0', '38,37']) {
    assert.equal(mapType(engine, 'decimal', size), expectedType(engine, 'decimal', size));
  }
  if (engine === 'snowflake') assert.throws(() => mapType(engine, 'decimal', '38,38'), /scale/);
  else assert.equal(mapType(engine, 'decimal', '38,38'), expectedType(engine, 'decimal', '38,38'));
  if (engine === 'bigquery') {
    for (const [size, expected] of [['29,0', 'NUMERIC(29,0)'], ['30,0', 'BIGNUMERIC(30,0)'],
      ['38,9', 'NUMERIC(38,9)'], ['38,10', 'BIGNUMERIC(38,10)'], ['36,2', 'BIGNUMERIC(36,2)']]) {
      assert.equal(mapType(engine, 'decimal', size), expected);
    }
  }
}

function checkQuotes(engine) {
  const name = 'a"b`c\\d';
  const expected = engine === 'bigquery' ? '`a"b\\`c\\\\d`'
    : engine === 'databricks' ? '`a"b``c\\d`' : '"a""b`c\\d"';
  assert.equal(quoteIdentifier(engine, name), expected);
  assert.equal(expectedQuote(engine, name), expected);
}

async function checkEngine(engine, datasets, schema) {
  const dir = `sql/${engine}`;
  const expectedFiles = [...datasets.map((d) => `${dir}/${d.slug}.sql`), `${dir}/all-tables.sql`].sort();
  assert.deepEqual((await files(dir)).sort(), expectedFiles);
  const statements = [];
  for (const d of datasets) {
    const rows = parseCsv(await read(`csv/datasets/${d.slug}.csv`)).slice(1);
    const expected = statement(engine, tableName(d.name), rows);
    const text = await read(`${dir}/${d.slug}.sql`);
    assert(text.startsWith(`-- ${d.name}\n`), 'Data set header');
    assert(text.includes('-- Target: '), 'Engine target header');
    checkText(text, expected);
    checkComments(text, d, schema);
    statements.push(expected);
  }
  const all = await read(`${dir}/all-tables.sql`);
  checkText(all, statements.join('\n'));
  assert.equal((executable(all).match(/^CREATE TABLE /gm) || []).length, 144);
  checkInvalidText(engine);
  checkMappingEdges(engine);
  checkQuotes(engine);
}

export async function checkEngines(schema) {
  const datasets = [...schema.datasets].sort((a, b) => a.slug < b.slug ? -1 : a.slug > b.slug ? 1 : 0);
  for (const engine of engineNames) await checkEngine(engine, datasets, schema);
  console.log('Five engine static checks passed: 725 files; exact aggregates, mapping edges, escaping and malformed SQL rejection.');
}
