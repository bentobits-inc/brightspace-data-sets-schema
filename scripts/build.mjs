import { createHash } from 'node:crypto';
import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { root, read, snapshot, sorted, joinKey, csv, files } from './lib/common.mjs';
import { diagramFiles } from './lib/diagrams.mjs';
import { sqlServerOutputs } from './lib/sqlserver.mjs';

async function verifySource() {
  const recorded = (await read('schema-source/SOURCE.md')).match(/SHA-256:\s*`([a-f0-9]{64})`/);
  const bytes = await readFile(join(root, 'schema-source/bds-schema.json'));
  if (bytes.includes(13)) throw new Error('Snapshot must use LF line endings only; CRLF is not accepted');
  const actual = createHash('sha256').update(bytes).digest('hex');
  if (!recorded || actual !== recorded[1]) throw new Error('Snapshot SHA-256 does not match SOURCE.md');
}

function columnRows(dataset, joins) {
  return dataset.columns.map((c, i) => {
    const targets = joins.filter((j) => j.from === dataset.slug && j.column === c.name);
    return [dataset.name, c.name, i + 1, c.type, c.size, c.pk, c.fk,
      targets.map((j) => j.to).join(';'), targets.map((j) => j.toColumn).join(';')];
  });
}

function outputs(schema) {
  const result = new Map();
  const datasets = sorted(schema.datasets, (d) => d.slug);
  const joins = sorted(schema.joins, joinKey);
  const header = ['dataset', 'column', 'position', 'type', 'size', 'primary_key', 'foreign_key', 'references_dataset', 'references_column'];
  const all = [['area', ...header]];
  const catalog = [['name', 'slug', 'area', 'column_count', 'primary_key', 'source_article_url']];
  for (const d of datasets) {
    const area = schema.articles.find((a) => a.id === d.articleIds[0]);
    const rows = columnRows(d, joins);
    result.set(`csv/datasets/${d.slug}.csv`, csv([header, ...rows]));
    all.push(...rows.map((row) => [area.name, ...row]));
    catalog.push([d.name, d.slug, area.name, d.columns.length, d.primaryKey.join(';'), area.url]);
  }
  result.set('csv/all-columns.csv', csv(all));
  result.set('csv/datasets.csv', csv(catalog));
  result.set('csv/joins.csv', csv([['from_dataset', 'from_column', 'to_dataset', 'to_column', 'kind'],
    ...joins.map((j) => [j.from, j.column, j.to, j.toColumn, j.kind])]));
  result.set('csv/unresolved-foreign-keys.csv', csv([['dataset', 'column'],
    ...sorted(schema.unresolvedFks, (u) => `${u.dataset}|${u.column}`).map((u) => [u.dataset, u.column])]));
  return new Map([...result, ...diagramFiles(schema), ...sqlServerOutputs(schema).files]);
}

async function build(check) {
  await verifySource();
  const generated = outputs(await snapshot());
  const existing = (await Promise.all(['csv', 'diagrams', 'sql'].map(files))).flat();
  const extra = existing.filter((path) => !generated.has(path));
  if (extra.length) throw new Error(`Extra generated files: ${extra.join(', ')}`);
  const mismatches = [];
  for (const [path, content] of generated) {
    if (check) {
      const actual = await read(path).catch((e) => { if (e.code === 'ENOENT') return null; throw e; });
      if (actual !== content) mismatches.push(path);
    } else {
      await mkdir(dirname(join(root, path)), { recursive: true });
      await writeFile(join(root, path), content, 'utf8');
    }
  }
  if (mismatches.length) throw new Error(`Missing or different generated files: ${mismatches.join(', ')}`);
  console.log(`${check ? 'Verified' : 'Built'} ${generated.size} generated files; snapshot SHA-256 verified.`);
}

if (process.argv.slice(2).some((arg) => arg !== '--check')) throw new Error('Usage: node scripts/build.mjs [--check]');
await build(process.argv.includes('--check'));
