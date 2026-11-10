const namePattern = /^[A-Za-z_][A-Za-z0-9_.:-]*/;
const tags = new Set(['svg', 'title', 'desc', 'rect', 'text', 'path', 'defs', 'marker']);
const predefined = { amp: '&', lt: '<', gt: '>', apos: "'", quot: '"' };

function validChar(code) {
  return code === 9 || code === 10 || code === 13 || (code >= 0x20 && code <= 0xD7FF)
    || (code >= 0xE000 && code <= 0xFFFD) || (code >= 0x10000 && code <= 0x10FFFF);
}

function decode(text) {
  if (text.includes('<') || text.includes(']]>')) throw new Error('Raw XML delimiter');
  let result = '';
  for (let i = 0; i < text.length; i++) {
    if (text[i] !== '&') { result += text[i]; continue; }
    const end = text.indexOf(';', i);
    if (end < 0) throw new Error('Raw ampersand');
    const entity = text.slice(i + 1, end);
    if (Object.hasOwn(predefined, entity)) result += predefined[entity];
    else if (/^#(?:[0-9]+|x[0-9a-fA-F]+)$/.test(entity)) {
      const code = entity[1] === 'x' ? parseInt(entity.slice(2), 16) : Number(entity.slice(1));
      if (!validChar(code)) throw new Error('Invalid XML numeric character');
      result += String.fromCodePoint(code);
    } else throw new Error('Undefined XML entity');
    i = end;
  }
  return result;
}

export function parseSvg(source) {
  for (const char of source) if (!validChar(char.codePointAt(0))) throw new Error('Invalid literal XML character');
  let pos = 0, roots = 0;
  const stack = [], nodes = [];
  const whitespace = () => { const start = pos; while (/[\t\n\r ]/.test(source[pos] ?? '') && pos < source.length) pos++; return pos > start; };
  const name = () => {
    const value = source.slice(pos).match(namePattern)?.[0];
    if (!value) throw new Error('Expected XML name');
    pos += value.length; return value;
  };
  while (pos < source.length) {
    if (source[pos] !== '<') {
      const end = source.indexOf('<', pos);
      const text = decode(source.slice(pos, end < 0 ? source.length : end));
      if (!stack.length && text.trim()) throw new Error('Text outside root');
      if (stack.length) stack.at(-1).text += text;
      pos = end < 0 ? source.length : end; continue;
    }
    pos++;
    if (source[pos] === '/') {
      pos++; const closing = name(); whitespace();
      if (source[pos++] !== '>' || stack.pop()?.name !== closing) throw new Error('Unbalanced XML tag');
      continue;
    }
    const tag = name();
    if (!tags.has(tag)) throw new Error(`Unsupported SVG element: ${tag}`);
    const attrs = {};
    while (true) {
      const spaced = whitespace();
      if (source[pos] === '>' || source.slice(pos, pos + 2) === '/>') break;
      if (!spaced) throw new Error('Missing space before attribute');
      const attribute = name(); whitespace();
      if (Object.hasOwn(attrs, attribute)) throw new Error('Duplicate XML attribute');
      if (source[pos++] !== '=') throw new Error('Missing attribute equals');
      whitespace(); const quote = source[pos++];
      if (quote !== '"' && quote !== "'") throw new Error('Unquoted attribute');
      const end = source.indexOf(quote, pos);
      if (end < 0) throw new Error('Unterminated attribute');
      attrs[attribute] = decode(source.slice(pos, end)); pos = end + 1;
    }
    if (!stack.length) {
      if (++roots !== 1 || tag !== 'svg' || attrs.xmlns !== 'http://www.w3.org/2000/svg') throw new Error('Expected one namespaced SVG root');
    }
    const node = { name: tag, attrs, text: '' };
    nodes.push(node);
    if (source.slice(pos, pos + 2) === '/>') pos += 2;
    else { pos++; stack.push(node); }
  }
  if (stack.length || roots !== 1) throw new Error('Incomplete XML document');
  return nodes;
}
