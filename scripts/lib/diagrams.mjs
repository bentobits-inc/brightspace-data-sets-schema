import { areaSlug, sorted, joinKey } from './common.mjs';

const xml = (value) => String(value).replaceAll('&', '&amp;').replaceAll('<', '&lt;')
  .replaceAll('>', '&gt;').replaceAll('"', '&quot;').replaceAll("'", '&apos;');

function wrap(text, limit = 46) {
  const lines = [];
  while (text.length > limit) {
    let end = text.lastIndexOf(' ', limit);
    if (end < limit / 2) end = limit;
    lines.push(text.slice(0, end));
    text = text.slice(end).trimStart();
  }
  return [...lines, text];
}

function boxDetails(dataset, kind, schema) {
  const joins = sorted(schema.joins.filter((j) => j.from === dataset.slug), joinKey);
  const joined = new Set(joins.map((j) => j.column));
  const target = new Set(schema.joins.filter((j) => j.to === dataset.slug).map((j) => j.toColumn));
  const columns = dataset.columns.filter((c) => c.pk || c.fk || joined.has(c.name) || target.has(c.name));
  const names = new Map(schema.datasets.map((d) => [d.slug, d.name]));
  const lines = kind === 'full' ? columns.flatMap((c) => {
    const targets = [...new Set(joins.filter((j) => j.column === c.name).map((j) => names.get(j.to)))];
    const text = `${c.pk ? 'PK ' : ''}${c.fk ? 'FK ' : ''}${c.name}${targets.length ? ' > ' + targets.join(', ') : ''}`;
    return wrap(text).map((text) => ({ text, column: c.name }));
  }) : ['External table', 'See its own area for columns'].map((text) => ({ text }));
  const heading = wrap(dataset.name);
  return { dataset, kind, heading, lines, h: 34 + heading.length * 18 + lines.length * 18, w: 440 };
}

function layout(boxes) {
  let y = 108;
  for (let i = 0; i < boxes.length; i += 3) {
    const row = boxes.slice(i, i + 3);
    row.forEach((b, col) => { b.x = 40 + col * 490; b.y = y; });
    y += Math.max(...row.map((b) => b.h)) + 64;
  }
  return y + 10;
}

function drawBox(box) {
  const { dataset, kind, x, y, w, h, heading, lines } = box;
  const rect = `<rect data-kind="${kind}" data-dataset="${xml(dataset.slug)}" x="${x}" y="${y}" width="${w}" height="${h}" rx="6" fill="${kind === 'full' ? '#f1f6fc' : '#fff8ea'}" stroke="#405775"${kind === 'stub' ? ' stroke-dasharray="6 4"' : ''}/>`;
  const rows = [...heading.map((text) => ({ text })), ...lines];
  const text = rows.map((line, i) => {
    const column = line.column ? ` data-row-dataset="${xml(dataset.slug)}" data-row-column="${xml(line.column)}"` : '';
    return `<text data-box-dataset="${xml(dataset.slug)}"${column} x="${x + 14}" y="${y + 24 + i * 18}" font-size="${i < heading.length ? 14 : 12}"${i < heading.length ? ' font-weight="bold"' : ''}>${xml(line.text)}</text>`;
  });
  return [rect, ...text].join('\n');
}

function edge(join, positions, index) {
  const from = positions.get(join.from);
  const to = positions.get(join.to);
  const startY = from.y + from.h-12;
  const endY = to.y + to.h-12;
  const lane = 12 + index % 6 * 3;
  const right = from.x + from.w + lane;
  const left = to.x-lane;
  const top = from.y-16-index % 6 * 3;
  const d = `M ${from.x + from.w} ${startY} H ${right} V ${top} H ${left} V ${endY} H ${to.x}`;
  return `<path data-from-dataset="${xml(join.from)}" data-from-column="${xml(join.column)}" data-to-dataset="${xml(join.to)}" data-to-column="${xml(join.toColumn)}" data-join-kind="${join.kind}" d="${d}" fill="none" stroke="${join.kind === 'user' ? '#97531b' : '#3974a5'}" stroke-width="1.3" marker-end="url(#arrow)"><title>${xml(`${join.from}.${join.column} to ${join.to}.${join.toColumn} (${join.kind})`)}</title></path>`;
}

export function diagramFiles(schema) {
  const output = new Map();
  const index = ['# Area diagrams', '', 'Full boxes show keys and relationship columns. Dashed amber boxes refer to another area.',
    'PK marks a primary key; FK marks a source foreign key; > names every outgoing target dataset. Long rows wrap inside their box. Hover over a line for its columns.',
    'Blue lines are key joins; brown lines are user joins. Lines point to their target table.', ''];
  for (const area of sorted(schema.articles, (a) => areaSlug(a.name))) {
    const datasets = sorted(schema.datasets.filter((d) => d.articleIds[0] === area.id), (d) => d.slug);
    const slugs = new Set(datasets.map((d) => d.slug));
    const joins = sorted(schema.joins.filter((j) => slugs.has(j.from)), joinKey);
    const stubs = sorted(schema.datasets.filter((d) => !slugs.has(d.slug) && joins.some((j) => j.to === d.slug)), (d) => d.slug);
    const boxes = [...datasets.map((d) => boxDetails(d, 'full', schema)), ...stubs.map((d) => boxDetails(d, 'stub', schema))];
    const height = layout(boxes);
    const positions = new Map(boxes.map((b) => [b.dataset.slug, b]));
    const width = Math.min(3, boxes.length) * 490 + 30;
    const svg = [`<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}" font-family="monospace" fill="#172c44">`,
      `<title>${xml(area.name)}</title>`, '<desc>Keys and relationship columns from the pinned documentation snapshot. External tables have dashed borders.</desc>',
      `<rect x="0" y="0" width="${width}" height="${height}" fill="white"/>`,
      '<defs><marker id="arrow" markerWidth="6" markerHeight="6" refX="6" refY="3" orient="auto"><path d="M 0 0 L 6 3 L 0 6 Z" fill="#405775"/></marker></defs>',
      `<text x="40" y="34" font-size="20" font-weight="bold">${xml(area.name)}</text>`,
      '<text x="40" y="59" font-size="12">PK: primary key; FK: foreign key; >: outgoing join. Dashed boxes: external area.</text>',
      ...joins.map((j, i) => edge(j, positions, i)), ...boxes.map(drawBox), '</svg>', ''].join('\n');
    const slug = areaSlug(area.name);
    output.set(`diagrams/${slug}.svg`, svg);
    index.push(`* [${area.name}](${slug}.svg): ${datasets.length} full tables, ${stubs.length} external tables.`);
  }
  output.set('diagrams/README.md', index.join('\n') + '\n');
  return output;
}
