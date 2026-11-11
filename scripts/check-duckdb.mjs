import assert from 'node:assert/strict';
import { read, snapshot } from './lib/common.mjs';
import { parseCsv } from './lib/parse-csv.mjs';
import { tableName } from './lib/sqlserver.mjs';
import { expectedType } from './lib/check-engines.mjs';

async function loadPackage() {
  try { return await import('@duckdb/node-api'); }
  catch (error) {
    if (error.code === 'ERR_MODULE_NOT_FOUND' && /^Cannot find package '@duckdb\/node-api' imported from /.test(error.message)) {
      console.log('SKIPPED: @duckdb/node-api is not installed.');
      return null;
    }
    throw error;
  }
}

async function inMemory(DuckDBInstance, action) {
  const instance = await DuckDBInstance.create(':memory:');
  let connection;
  try {
    connection = await instance.connect();
    await action(connection);
  } finally {
    connection?.closeSync();
    instance.closeSync();
  }
}

async function expectedColumns(datasets) {
  const expected = [];
  for (const d of datasets) {
    const rows = parseCsv(await read(`csv/datasets/${d.slug}.csv`)).slice(1);
    for (const r of rows) {
      const type = expectedType('duckdb', r[3], r[4]);
      const decimal = r[3] === 'decimal' ? r[4].split(',').map(Number) : null;
      expected.push({ table_name: tableName(d.name), column_name: r[1], ordinal_position: Number(r[2]),
        data_type: type === 'REAL' ? 'FLOAT' : type, numeric_precision: decimal?.[0] ?? null, numeric_scale: decimal?.[1] ?? null, is_nullable: 'YES' });
    }
  }
  return expected.sort((a, b) => a.table_name < b.table_name ? -1 : a.table_name > b.table_name ? 1
    : a.ordinal_position-b.ordinal_position);
}

async function verifyColumns(connection, datasets) {
  const reader = await connection.runAndReadAll(`SELECT table_name, column_name, ordinal_position, data_type,
    CASE WHEN data_type LIKE 'DECIMAL%' THEN numeric_precision END AS numeric_precision,
    CASE WHEN data_type LIKE 'DECIMAL%' THEN numeric_scale END AS numeric_scale, is_nullable
    FROM information_schema.columns WHERE table_schema = 'main' ORDER BY table_name, ordinal_position`);
  const actual = reader.getRowObjects();
  assert.equal(new Set(actual.map((c) => c.table_name)).size, 144);
  const expected = await expectedColumns(datasets);
  assert.equal(actual.length, 1601);
  assert.deepEqual(actual, expected, 'Column metadata must match independent CSV expectations');
  const constraints = await connection.runAndReadAll('SELECT * FROM duckdb_constraints()');
  assert.deepEqual(constraints.getRowObjects(), [], 'No constraints may exist');
}

async function checkDuckDB(connection, datasets) {
  for (const d of datasets) await connection.run(await read(`sql/duckdb/${d.slug}.sql`));
  const all = await read('sql/duckdb/all-tables.sql');
  await connection.run(all);
  await connection.run('INSERT INTO "Users" ("UserId") VALUES (42)');
  await connection.run(all);
  const kept = await connection.runAndReadAll('SELECT "UserId" FROM "Users"');
  assert.deepEqual(kept.getRowObjects(), [{ UserId: 42 }], 'Rerunning scripts must preserve the row');
  await verifyColumns(connection, datasets);
  console.log('DuckDB check passed: 144 individual scripts, aggregate run twice, row kept, 1601 columns verified, no constraints.');
}

async function checkPostgresCompatibility(connection) {
  await connection.run(await read('sql/postgres/all-tables.sql'));
  const tables = await connection.runAndReadAll("SELECT table_name FROM information_schema.tables WHERE table_schema = 'main'");
  assert.equal(tables.getRowObjects().length, 144);
  console.log("Postgres scripts executed under DuckDB's dialect and types using its Postgres-derived parser: 144 tables; compatibility evidence only, not a Postgres validation.");
}

async function main() {
  const api = await loadPackage();
  if (!api) return;
  const schema = await snapshot();
  const datasets = [...schema.datasets].sort((a, b) => a.slug < b.slug ? -1 : a.slug > b.slug ? 1 : 0);
  await inMemory(api.DuckDBInstance, (connection) => checkDuckDB(connection, datasets));
  await inMemory(api.DuckDBInstance, checkPostgresCompatibility);
}

try { await main(); }
catch (error) {
  console.error('DuckDB check failed:', error);
  process.exitCode = 1;
}
