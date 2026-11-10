import { sorted } from './common.mjs';

// Source types are already SQL Server type names. Every distinct type/size pair in the snapshot
// is handled explicitly here; anything else fails the build instead of being guessed.
const fixed = {
  bigint: { sizes: ['8'], sql: 'bigint' },
  int: { sizes: ['4', '8'], sql: 'int' }, // two Course Publisher and CPD columns say size 8; D2L's type is int
  smallint: { sizes: ['2'], sql: 'smallint' },
  bit: { sizes: ['1'], sql: 'bit' },
  datetime2: { sizes: ['8'], sql: 'datetime2' },
  uniqueidentifier: { sizes: ['16', '36'], sql: 'uniqueidentifier' }, // size 36 is the text length in one LTI Links column
  float: { sizes: ['24', '53'], sql: (size) => `float(${size})` }
};

export function mapType(type, size) {
  const where = `${type}(${size})`;
  if (fixed[type]) {
    if (!fixed[type].sizes.includes(size)) throw new Error(`Unknown size for type: ${where}`);
    const sql = fixed[type].sql;
    const text = typeof sql === 'function' ? sql(size) : sql;
    return expect(text, type === 'float' ? { dataType: size === '24' ? 'real' : 'float', precision: Number(size) } : { dataType: type });
  }
  if (type === 'decimal') {
    const m = /^(\d+),\s*(\d+)$/.exec(size);
    if (!m) throw new Error(`Unknown size for type: ${where}`);
    const [p, s] = [Number(m[1]), Number(m[2])];
    if (p < 1 || p > 38 || s > p) throw new Error(`Invalid decimal precision: ${where}`);
    return expect(`decimal(${p},${s})`, { dataType: 'decimal', precision: p, scale: s });
  }
  if (type === 'nvarchar' || type === 'varchar') {
    if (!/^[1-9]\d*$/.test(size)) throw new Error(`Unknown size for type: ${where}`);
    const n = Number(size);
    const limit = type === 'nvarchar' ? 4000 : 8000;
    if (n > limit) return expect(`${type}(max)`, { dataType: type, length: -1 });
    return expect(`${type}(${n})`, { dataType: type, length: n });
  }
  throw new Error(`Unknown type: ${where}`);
}

const expect = (sql, expected) => ({ sql, expected });

export const tableName = (name) => name.replace(/[^A-Za-z0-9]+/g, ' ').trim().split(' ')
  .map((w) => w[0].toUpperCase() + w.slice(1)).join('');
const q = (id) => `[${id.replaceAll(']', ']]')}]`;

const credit = '-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,\n'
  + "-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),\n"
  + '-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.\n';

// Returns { tables: [{ slug, table, name, columns: [{ name, sql, expected }] }], files: Map }.
export function sqlServerOutputs(schema) {
  const datasets = sorted(schema.datasets, (d) => d.slug);
  const slugTable = new Map(datasets.map((d) => [d.slug, tableName(d.name)]));
  const seen = new Set();
  const tables = datasets.map((d) => {
    const table = slugTable.get(d.slug);
    if (seen.has(table.toLowerCase())) throw new Error(`Duplicate table name: ${table}`);
    seen.add(table.toLowerCase());
    const names = new Set();
    const columns = d.columns.map((c) => {
      if (names.has(c.name.toLowerCase())) throw new Error(`Duplicate column ${table}.${c.name}`);
      names.add(c.name.toLowerCase());
      return { name: c.name, ...mapType(c.type, c.size) };
    });
    const joins = sorted(schema.joins.filter((j) => j.from === d.slug), (j) => `${j.column}|${j.to}|${j.toColumn}`);
    return { slug: d.slug, table, name: d.name, columns, primaryKey: d.primaryKey, joins };
  });
  const files = new Map();
  const bodies = tables.map((t) => {
    const body = tableBody(t, slugTable);
    files.set(`sql/sqlserver/${t.slug}.sql`, `-- ${t.name}\n${credit}\n${body}`);
    return `-- ${t.name}\n${body}`;
  });
  files.set('sql/sqlserver/all-tables.sql', '-- All 144 Brightspace Data Sets tables for SQL Server 2016 or later. Safe to run again.\n'
    + `${credit}\n${bodies.join('\n')}`);
  return { tables, files };
}

function tableBody(t, slugTable) {
  const lines = [];
  lines.push(`-- Primary key (informational, not enforced): ${t.primaryKey.join(', ')}`);
  lines.push('-- BDS keys can repeat across differential files, so no constraints are created.');
  for (const j of t.joins) lines.push(`-- Join (informational): ${j.column} -> ${slugTable.get(j.to)}.${j.toColumn}`);
  const id = `${q('dbo')}.${q(t.table)}`;
  lines.push(`DROP TABLE IF EXISTS ${id};`, `CREATE TABLE ${id} (`);
  lines.push(t.columns.map((c) => `    ${q(c.name)} ${c.sql} NULL`).join(',\n'));
  lines.push(');', '');
  return lines.join('\n');
}
