import assert from 'node:assert/strict';
import { snapshot, read, files, areaSlug, joinKey } from './lib/common.mjs';
import { parseSvg } from './lib/xml.mjs';

function selfTest() {
  const prefix = '<svg xmlns="http://www.w3.org/2000/svg">';
  parseSvg(`${prefix}<text>&lt;&gt;&quot;&apos;&amp;&#65;&#x1F600;</text></svg>`);
  const bad = ['<rect x="1" x="2"/>', '<text>&missing;</text>', '<text>a & b</text>',
    '<text></rect>', '<text>&#0;</text>', '<text>&#xFFFE;</text>', '<text>\u0001</text>',
    '<rect x="a<b"/>', '<rect x=1/>', '<text>\uD800</text>'];
  for (const sample of bad) assert.throws(() => parseSvg(prefix + sample + '</svg>'));
  assert.throws(() => parseSvg(prefix + '</svg>' + prefix + '</svg>'));
  const schema = { datasets: [{ slug: 'source', articleIds: ['area'], columns: [{ name: 'TargetId' }] },
    { slug: 'first', name: 'First Table', articleIds: ['other'] },
    { slug: 'second', name: 'Second Table', articleIds: ['other'] }],
    joins: [{ from: 'source', column: 'TargetId', to: 'first' },
      { from: 'source', column: 'TargetId', to: 'second' }] };
  const row = (text) => ({ name: 'text', attrs: { 'data-row-dataset': 'source', 'data-row-column': 'TargetId' }, text });
  const area = { id: 'area' };
  joinedRowsIn([row('FK TargetId > First Table,'), row('Second Table')], schema, area);
  assert.throws(() => joinedRowsIn([row('FK TargetId > First Table')], schema, area), /Missing row target/);
  assert.throws(() => joinedRowsIn([], schema, area), /Missing join marker/);
}

function boxesIn(nodes, datasets, area) {
  const boxes = nodes.filter((n) => n.name === 'rect' && n.attrs['data-kind']);
  const seen = new Set();
  for (const { attrs: a } of boxes) {
    const d = datasets.get(a['data-dataset']);
    assert(d, `Unknown dataset box: ${a['data-dataset']}`);
    assert(!seen.has(d.slug), `Duplicate box: ${d.slug}`); seen.add(d.slug);
    assert(['full', 'stub'].includes(a['data-kind']));
    assert.equal(d.articleIds[0] === area.id, a['data-kind'] === 'full', `Wrong box area: ${d.slug}`);
    for (const key of ['x', 'y', 'width', 'height']) assert(Number.isFinite(Number(a[key])), `Invalid box ${key}`);
    assert(Number(a.width) > 0 && Number(a.height) > 0);
  }
  for (let i = 0; i < boxes.length; i++) {
    const a = boxes[i].attrs;
    for (const box of boxes.slice(i + 1)) {
      const b = box.attrs;
      const overlap = +a.x < +b.x + +b.width && +b.x < +a.x + +a.width
        && +a.y < +b.y + +b.height && +b.y < +a.y + +a.height;
      assert(!overlap, `Overlapping boxes: ${a['data-dataset']}, ${b['data-dataset']}`);
    }
  }
  return boxes;
}

function edgesIn(nodes, schema, area, boxSlugs) {
  const actual = nodes.filter((n) => n.attrs['data-from-dataset']).map(({ attrs: a }) => {
    assert.equal(a['data-from-column'] !== undefined && a['data-to-column'] !== undefined, true);
    assert.equal(a['data-to-dataset'] !== undefined, true);
    assert.equal(boxSlugs.has(a['data-from-dataset']) && boxSlugs.has(a['data-to-dataset']), true);
    return joinKey({ from: a['data-from-dataset'], column: a['data-from-column'], to: a['data-to-dataset'],
      toColumn: a['data-to-column'], kind: a['data-join-kind'] });
  }).sort();
  const own = new Set(schema.datasets.filter((d) => d.articleIds[0] === area.id).map((d) => d.slug));
  const expected = schema.joins.filter((j) => own.has(j.from)).map(joinKey).sort();
  assert.deepEqual(actual, expected, `Diagram join fidelity: ${area.name}`);
  return actual.length;
}

function joinedRowsIn(nodes, schema, area) {
  for (const dataset of schema.datasets.filter((d) => d.articleIds[0] === area.id)) {
    for (const column of dataset.columns) {
      const targets = schema.joins.filter((j) => j.from === dataset.slug && j.column === column.name);
      if (!targets.length) continue;
      const lines = nodes.filter((n) => n.name === 'text' && n.attrs['data-row-dataset'] === dataset.slug
        && n.attrs['data-row-column'] === column.name);
      const text = lines.map((n) => n.text).join(' ');
      assert(text.includes('>'), `Missing join marker: ${dataset.slug}.${column.name}`);
      for (const target of targets) {
        const name = schema.datasets.find((d) => d.slug === target.to).name;
        assert(text.includes(name), `Missing row target: ${dataset.slug}.${column.name} to ${name}`);
      }
    }
  }
}

function textInBoxes(nodes, boxes) {
  for (const node of nodes.filter((n) => n.name === 'text')) {
    const a = node.attrs, size = Number(a['font-size']);
    assert(size >= 12);
    if (!a['data-box-dataset']) continue;
    const box = boxes.find((b) => b.attrs['data-dataset'] === a['data-box-dataset'])?.attrs;
    assert(box, 'Text must belong to a real box');
    const fits = +a.x >= +box.x && +a.x + node.text.length * size * 0.65 <= +box.x + +box.width
      && +a.y-size >= +box.y && +a.y + size * 0.25 <= +box.y + +box.height;
    assert(fits, `Text overflows box: ${a['data-box-dataset']}: ${node.text}`);
  }
}

selfTest();
const schema = await snapshot();
const datasets = new Map(schema.datasets.map((d) => [d.slug, d]));
const counts = new Map(schema.datasets.map((d) => [d.slug, 0]));
const paths = (await files('diagrams')).filter((p) => p.endsWith('.svg'));
assert.deepEqual(paths.sort(), schema.articles.map((a) => `diagrams/${areaSlug(a.name)}.svg`).sort());
let edges = 0;
for (const area of schema.articles) {
  const nodes = parseSvg(await read(`diagrams/${areaSlug(area.name)}.svg`));
  const boxes = boxesIn(nodes, datasets, area);
  for (const b of boxes.filter((b) => b.attrs['data-kind'] === 'full')) {
    const slug = b.attrs['data-dataset']; counts.set(slug, counts.get(slug) + 1);
  }
  textInBoxes(nodes, boxes);
  joinedRowsIn(nodes, schema, area);
  edges += edgesIn(nodes, schema, area, new Set(boxes.map((b) => b.attrs['data-dataset'])));
}
for (const [slug, count] of counts) assert.equal(count, 1, `Full box count: ${slug}`);
assert.equal(edges, schema.joins.length);
console.log(`SVG validation passed: ${paths.length} areas, 144 full tables, ${edges} exact joins; XML self-tests passed.`);
