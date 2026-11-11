import { sorted } from './common.mjs';
import { tableName } from './sqlserver.mjs';

export const engines = {
  postgres: { target: 'Postgres 9.1 or later', quote: '"', types: ['bigint', 'integer', 'smallint', 'boolean', 'timestamp', 'uuid', 'real', 'double precision'] },
  snowflake: { target: 'Snowflake (current)', quote: '"', types: ['BIGINT', 'INT', 'SMALLINT', 'BOOLEAN', 'TIMESTAMP_NTZ', 'VARCHAR(36)', 'FLOAT', 'FLOAT'] },
  bigquery: { target: 'BigQuery (current)', quote: '`', types: ['INT64', 'INT64', 'INT64', 'BOOL', 'DATETIME', 'STRING(36)', 'FLOAT64', 'FLOAT64'] },
  databricks: { target: 'Databricks Runtime 13.3 LTS or later', quote: '`', types: ['BIGINT', 'INT', 'SMALLINT', 'BOOLEAN', 'TIMESTAMP_NTZ', 'STRING', 'FLOAT', 'DOUBLE'] },
  duckdb: { target: 'DuckDB (current)', quote: '"', types: ['BIGINT', 'INTEGER', 'SMALLINT', 'BOOLEAN', 'TIMESTAMP', 'UUID', 'REAL', 'DOUBLE'] }
};

const fixed = new Map([
  ['bigint', [['8'], 0]], ['int', [['4', '8'], 1]], ['smallint', [['2'], 2]],
  ['bit', [['1'], 3]], ['datetime2', [['8'], 4]], ['uniqueidentifier', [['16', '36'], 5]],
  ['float', [['24', '53'], 6]]
]);

export function quoteIdentifier(engine, name) {
  const { quote } = definition(engine);
  const escaped = engine === 'bigquery' ? name.replaceAll('\\', '\\\\').replaceAll('`', '\\`')
    : name.replaceAll(quote, quote + quote);
  return quote + escaped + quote;
}

function definition(engine) {
  if (!Object.hasOwn(engines, engine)) throw new Error(`Unknown engine: ${engine}`);
  return engines[engine];
}

function decimalType(engine, size) {
  const match = /^(\d+),\s*(\d+)$/.exec(size);
  if (!match) throw new Error(`Unknown size for decimal: ${size}`);
  const [p, s] = match.slice(1).map(Number);
  if (p < 1 || p > 38 || s > p) throw new Error(`Invalid decimal precision: ${size}`);
  if (engine === 'snowflake' && s > 37) throw new Error(`Invalid decimal scale: ${size}`);
  let type = { postgres: 'numeric', snowflake: 'NUMBER', databricks: 'DECIMAL', duckdb: 'DECIMAL' }[engine];
  if (engine === 'bigquery') {
    if (s <= 9 && p >= Math.max(1, s) && p <= s + 29) type = 'NUMERIC';
    else if (s <= 38 && p >= Math.max(1, s) && p <= s + 38) type = 'BIGNUMERIC';
    else throw new Error(`Invalid decimal precision: ${size}`);
  }
  return `${type}(${p},${s})`;
}

function textType(engine, size) {
  if (!/^[1-9]\d*$/.test(size)) throw new Error(`Unknown text size: ${size}`);
  const n = Number(size);
  const limit = engine === 'snowflake' ? 134217728 : 10485760;
  if (!Number.isSafeInteger(n) || n > limit) throw new Error(`Invalid text size: ${size}`);
  return { postgres: `varchar(${n})`, snowflake: `VARCHAR(${n})`, bigquery: `STRING(${n})`,
    databricks: 'STRING', duckdb: 'VARCHAR' }[engine];
}

export function mapType(engine, type, size) {
  const config = definition(engine);
  if (fixed.has(type)) {
    const [sizes, index] = fixed.get(type);
    if (!sizes.includes(size)) throw new Error(`Unknown size for ${type}: ${size}`);
    return config.types[index + (type === 'float' && size === '53' ? 1 : 0)];
  }
  if (type === 'decimal') return decimalType(engine, size);
  if (type === 'nvarchar' || type === 'varchar') return textType(engine, size);
  throw new Error(`Unknown type: ${type}(${size})`);
}

const credit = '-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.\n'
  + "-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).\n"
  + '-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.\n';

function tableBody(engine, dataset, schema, names) {
  const q = (name) => quoteIdentifier(engine, name);
  const joins = sorted(schema.joins.filter((j) => j.from === dataset.slug), (j) => `${j.column}|${j.to}|${j.toColumn}`);
  const lines = [`-- Primary key (informational, not enforced): ${dataset.primaryKey.join(', ')}`,
    '-- BDS keys can repeat across differential files, so no constraints are created.'];
  for (const j of joins) lines.push(`-- Join (informational): ${j.column} -> ${names.get(j.to)}.${j.toColumn}`);
  lines.push(`CREATE TABLE IF NOT EXISTS ${q(names.get(dataset.slug))} (`);
  lines.push(dataset.columns.map((c) => `    ${q(c.name)} ${mapType(engine, c.type, c.size)}`).join(',\n'));
  lines.push(');', '');
  return lines.join('\n');
}

export function engineOutputs(schema) {
  const datasets = sorted(schema.datasets, (d) => d.slug);
  const names = new Map(datasets.map((d) => [d.slug, tableName(d.name)]));
  const files = new Map();
  for (const [engine, config] of Object.entries(engines)) {
    const bodies = datasets.map((d) => {
      const body = tableBody(engine, d, schema, names);
      files.set(`sql/${engine}/${d.slug}.sql`, `-- ${d.name}\n${credit}-- Target: ${config.target}.\n\n${body}`);
      return `-- ${d.name}\n${body}`;
    });
    files.set(`sql/${engine}/all-tables.sql`, `-- All ${datasets.length} Brightspace Data Sets tables for ${config.target}.\n`
      + `${credit}\n${bodies.join('\n')}`);
  }
  return files;
}
