import { readFile, readdir } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';

export const root = fileURLToPath(new URL('../../', import.meta.url));
export const read = (path) => readFile(new URL(path, new URL('../../', import.meta.url)), 'utf8');
export const snapshot = async () => JSON.parse(await read('schema-source/bds-schema.json'));
export const compare = (a, b) => a < b ? -1 : a > b ? 1 : 0;
export const sorted = (items, key) => [...items].sort((a, b) => compare(key(a), key(b)));
export const areaSlug = (name) => name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
export const joinKey = (j) => [j.from, j.column, j.to, j.toColumn, j.kind].join('|');

export function csv(rows) {
  const field = (value) => {
    const text = value == null ? '' : String(value);
    return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text;
  };
  return rows.map((row) => row.map(field).join(',')).join('\n') + '\n';
}

export async function files(directory) {
  let entries;
  try { entries = await readdir(new URL(directory + '/', new URL('../../', import.meta.url)), { withFileTypes: true }); }
  catch (error) { if (error.code === 'ENOENT') return []; throw error; }
  const result = [];
  for (const entry of entries.sort((a, b) => compare(a.name, b.name))) {
    const path = `${directory}/${entry.name}`;
    if (entry.isSymbolicLink()) throw new Error(`Unexpected symbolic link: ${path}`);
    result.push(...(entry.isDirectory() ? await files(path) : [path]));
  }
  return result;
}
