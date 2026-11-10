// Loads the generated SQL Server scripts into a throwaway LocalDB database and verifies the result.
// Not part of `npm run check`. Skips only when sqlcmd or LocalDB is absent. Needs Windows.
import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { randomBytes } from 'node:crypto';
import { join } from 'node:path';
import { root, snapshot } from './lib/common.mjs';
import { sqlServerOutputs } from './lib/sqlserver.mjs';

// sqlcmd.exe re-parses its command line on Windows, so the backslash in the instance name is doubled.
const server = '(localdb)\\MSSQLLocalDB';

function skip(reason) {
  console.log(`SKIPPED: ${reason}. Install SQL Server Express LocalDB and sqlcmd to run this check.`);
  process.exit(0);
}

function present(command, args) {
  const r = spawnSync(command, args, { encoding: 'utf8' });
  return !r.error && r.status === 0;
}

if (!present('sqlcmd', ['-?'])) skip('sqlcmd was not found on PATH');
if (!present('SqlLocalDB', ['info'])) skip('SqlLocalDB was not found on PATH');
const instances = execFileSync('SqlLocalDB', ['info'], { encoding: 'utf8' }).split(/\r?\n/).map((s) => s.trim());
if (!instances.includes('MSSQLLocalDB')) execFileSync('SqlLocalDB', ['create', 'MSSQLLocalDB']);
execFileSync('SqlLocalDB', ['start', 'MSSQLLocalDB'], { stdio: 'ignore' });

function sqlcmd(args) {
  return execFileSync('sqlcmd', ['-S', server, '-E', '-C', '-b', '-w', '4000', ...args],
    { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
}

// A cold LocalDB instance can refuse the first connections, so wait until it answers.
for (let attempt = 1; ; attempt++) {
  try { sqlcmd(['-Q', 'SELECT 1']); break; } catch (error) {
    if (attempt === 6) { console.error(error.stderr || error.message); process.exit(1); }
  }
}

const database = `BdsSchemaCheck_${randomBytes(6).toString('hex')}`;
const inDb = (args) => sqlcmd(['-d', database, ...args]);

async function verify(tables) {
  const out = inDb(['-h', '-1', '-W', '-s', '|', '-Q', 'SET NOCOUNT ON; SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, '
    + "ISNULL(CHARACTER_MAXIMUM_LENGTH, -2), ISNULL(CAST(NUMERIC_PRECISION AS int), -2), ISNULL(CAST(NUMERIC_SCALE AS int), -2), IS_NULLABLE FROM INFORMATION_SCHEMA.COLUMNS "
    + 'ORDER BY TABLE_NAME COLLATE Latin1_General_BIN2, ORDINAL_POSITION']);
  const actual = out.split(/\r?\n/).filter(Boolean).map((l) => l.split('|'));
  const expected = [];
  for (const t of [...tables].sort((a, b) => (a.table < b.table ? -1 : 1))) {
    t.columns.forEach((c, i) => {
      const e = c.expected;
      const numeric = ['decimal', 'float', 'real'].includes(e.dataType);
      expected.push(['dbo', t.table, c.name, String(i + 1), e.dataType, String(e.length ?? -2),
        String(numeric ? e.precision : -2), String(e.scale ?? (e.dataType === 'decimal' ? 0 : -2)), 'YES']);
    });
  }
  // Fixed-width numeric types report their own precision; compare only the fields defined above.
  const normalised = actual.map((r) => {
    const numeric = ['decimal', 'float', 'real'].includes(r[4]);
    return [r[0], r[1], r[2], r[3], r[4], r[5], numeric ? r[6] : '-2', numeric && r[4] === 'decimal' ? r[7] : '-2', r[8]];
  });
  const want = expected.map((r) => [...r.slice(0, 7), r[4] === 'decimal' ? r[7] : '-2', r[8]]);
  const tableCount = inDb(['-h', '-1', '-W', '-Q', "SET NOCOUNT ON; SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"]).trim();
  assert.equal(tableCount, String(tables.length), 'Unexpected table count');
  assert.equal(normalised.length, want.length, 'Unexpected column count');
  for (let i = 0; i < want.length; i++) assert.deepEqual(normalised[i], want[i], `Column mismatch at row ${i + 1}`);
  const constraints = inDb(['-h', '-1', '-W', '-Q', 'SET NOCOUNT ON; SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS']).trim();
  assert.equal(constraints, '0', 'Scripts must not create constraints');
  return want.length;
}

let failure = null;
try {
  sqlcmd(['-Q', `CREATE DATABASE [${database}]`]);
  const { tables, files } = sqlServerOutputs(await snapshot());
  for (const path of [...files.keys()].filter((p) => !p.endsWith('all-tables.sql'))) inDb(['-i', join(root, path)]);
  console.log(`Ran ${tables.length} individual scripts.`);
  inDb(['-i', join(root, 'sql/sqlserver/all-tables.sql')]);
  inDb(['-i', join(root, 'sql/sqlserver/all-tables.sql')]);
  console.log('Ran all-tables.sql twice (rerunnable).');
  const columns = await verify(tables);
  console.log(`Verified ${tables.length} tables and ${columns} columns against INFORMATION_SCHEMA.COLUMNS (type, length, precision, scale, nullability); no constraints.`);
} catch (error) {
  failure = error;
} finally {
  try {
    sqlcmd(['-Q', `IF DB_ID(N'${database}') IS NOT NULL BEGIN ALTER DATABASE [${database}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [${database}]; END`]);
    console.log(`Dropped ${database}.`);
  } catch (error) {
    console.error(`Could not drop ${database}: ${error.message}`);
    failure ??= error;
  }
}
if (failure) {
  console.error(`SQL Server check failed: ${failure.stderr || failure.stdout || failure.message}`);
  process.exit(1);
}
console.log('SQL Server check passed.');
