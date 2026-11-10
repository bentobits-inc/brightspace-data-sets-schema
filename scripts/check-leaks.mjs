import assert from 'node:assert/strict';
import { readdir, readFile } from 'node:fs/promises';
import { join } from 'node:path';
import { root } from './lib/common.mjs';

const brandHost = ['row', 'seta', '.', 'com'].join('');
const allowedUrls = new Set([`https://${brandHost}`, `https://${brandHost}/guides/data-sets`]);
const allowedEmail = ['noreply', '@', 'bentobits.com'].join('');
const toolWords = ['clau' + 'de', 'co' + 'dex', 'co-' + 'authored', 'open' + 'ai', 'chat' + 'gpt'];
const patterns = [
  ['local path', new RegExp('(?:C:[\\\\/]+Us' + 'ers|D:[\\\\/]+De' + 'v|/ho' + 'me/|/Us' + 'ers/)', 'i')],
  ['hosting name', new RegExp('fly' + '\\.dev', 'i')],
  ['internal identifier', new RegExp('\\bM\\d+-\\d+\\b', 'i')],
  ['secret token', new RegExp('(?:sk_' + '(?:live|test)|wh' + 'sec_|AK' + 'IA[A-Z0-9]{16}|re' + '_[a-zA-Z0-9_-]{20,}|BEGIN ' + 'PRIVATE KEY)')],
  ['restricted word', new RegExp(toolWords.join('|'), 'i')],
  ['sentence punctuation', new RegExp('\\u2014| \\- ')]
];
const hostPattern = new RegExp('(?:https?://)?(?:[a-z0-9-]+\\.)*' + brandHost.replaceAll('.', '\\.')
  + '(?::[0-9]+)?(?:[/?#][^\\s<>"\'`\\)\\]\\}]*)?', 'gi');
const emailPattern = /[a-zA-Z0-9.!#$%&*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+/g;

const localFile = '.leak-patterns.local';

function localTerms(source) {
  return [...new Set(source.split(/\r?\n/).map((line) => line.trim().toLowerCase())
    .filter((line) => line && !line.startsWith('#')))];
}

async function loadLocalTerms() {
  try { return localTerms(await readFile(join(root, localFile), 'utf8')); }
  catch (error) { if (error.code === 'ENOENT') return []; throw error; }
}

function hits(text, terms = []) {
  const result = patterns.filter(([, regex]) => regex.test(text)).map(([label]) => label);
  if (terms.some((term) => text.toLowerCase().includes(term))) result.push('local private term');
  for (const match of text.matchAll(hostPattern)) {
    if (!allowedUrls.has(match[0])) result.push('unapproved hostname or URL');
  }
  for (const match of text.matchAll(emailPattern)) {
    if (match[0] !== allowedEmail) result.push('email address');
  }
  return [...new Set(result)];
}

function fileHits(path, text, terms) {
  if (path === localFile) return [];
  return text.split('\n').flatMap((line, i) => hits(line, terms).map((hit) => ({ line: i + 1, hit })));
}

function selfTest() {
  const backslash = String.fromCharCode(92);
  const positive = ['C:' + backslash + 'Us' + 'ers' + backslash + 'Sample',
    'D:' + backslash + 'De' + 'v' + backslash + 'Sample',
    'C:' + backslash.repeat(2) + 'Us' + 'ers' + backslash.repeat(2) + 'Sample',
    '/ho' + 'me/sample', '/Us' + 'ers/sample', `https://private.${brandHost}`,
    `https://${brandHost}/other`, `https://${brandHost}/guides/data-sets/extra`,
    'https://demo.fly' + '.dev', 'M' + '9-1234',
    'sk_' + 'live_example', 'sk_' + 'test_example', 'wh' + 'sec_example',
    'AK' + 'IA' + 'A'.repeat(16), 're' + '_' + 'a'.repeat(20), 'BEGIN ' + 'PRIVATE KEY',
    'sample' + '@' + 'example.com', ...toolWords, String.fromCharCode(0x2014), 'word' + ' ' + '-' + ' word'];
  for (const sample of positive) assert(hits(sample).length, 'Forbidden sample must be flagged');
  const negative = ['https://community.d2l.com/brightspace/kb/articles/4740-users-data-sets',
    'https://community.d2l.com/brightspace/kb/categories/1229-brightspace-data-sets',
    'a0d9c3f3b7e978f8a910afc446d99bfa4099f157', ...allowedUrls, allowedEmail, `'${allowedEmail}'`];
  for (const sample of negative) assert.deepEqual(hits(sample), [], 'Allowed sample must pass');
  const configuration = '\n # ignored comment\r\n  Example.Term+  \r\nEXAMPLE.TERM+\n\n';
  const terms = localTerms(configuration);
  assert.deepEqual(terms, ['example.term+']);
  assert.deepEqual(fileHits(localFile, configuration, terms), [], 'Configuration alone must pass');
  assert.deepEqual(fileHits('notes.txt', 'Safe line\nAn EXAMPLE.Term+ appears here', terms),
    [{ line: 2, hit: 'local private term' }], 'Configured terms in other files must fail regardless of case');
  assert.deepEqual(fileHits('notes.txt', 'exampleXterm', terms), [], 'Local terms must be literal');
  assert.deepEqual(fileHits(`nested/${localFile}`, 'example.term+', terms),
    [{ line: 1, hit: 'local private term' }], 'Only the root configuration is excluded');
}

async function scan(terms, directory = root, relative = '') {
  let count = 0, failures = 0;
  const entries = await readdir(directory, { withFileTypes: true });
  for (const entry of entries.sort((a, b) => a.name.localeCompare(b.name))) {
    if (!relative && ['node_modules', 'build-logs', '.git', localFile].includes(entry.name)) continue;
    const path = relative ? `${relative}/${entry.name}` : entry.name;
    if (entry.isSymbolicLink()) throw new Error(`Unexpected symbolic link: ${path}`);
    if (entry.isDirectory()) {
      const nested = await scan(terms, join(directory, entry.name), path);
      count += nested.count; failures += nested.failures; continue;
    }
    count++;
    const content = await readFile(join(directory, entry.name), 'utf8');
    for (const { line, hit } of fileHits(path, content, terms)) {
      console.error(`${path}:${line}: ${hit}`); failures++;
    }
  }
  return { count, failures };
}

selfTest();
const { count, failures } = await scan(await loadLocalTerms());
if (failures) throw new Error(`${failures} leak or writing-style hits`);
console.log(`Leak scan passed for ${count} files; positive and negative self-tests passed.`);
