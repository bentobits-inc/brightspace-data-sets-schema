// Independent reader for RFC 4180 fields; LF and CRLF record separators are accepted.
export function parseCsv(text) {
  const rows = [];
  let row = [], field = '', state = 'start';
  const finishField = () => { row.push(field); field = ''; state = 'start'; };
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    if (state === 'quoted') {
      if (c === '"' && text[i + 1] === '"') { field += '"'; i++; }
      else if (c === '"') state = 'closed';
      else field += c;
      continue;
    }
    if (c === '"') {
      if (state !== 'start') throw new Error('Quote inside unquoted CSV field');
      state = 'quoted';
    } else if (c === ',') finishField();
    else if (c === '\n' || c === '\r') {
      if (c === '\r' && text[++i] !== '\n') throw new Error('Bare CR in CSV');
      finishField(); rows.push(row); row = [];
    } else {
      if (state === 'closed') throw new Error('Text after closing CSV quote');
      field += c; state = 'plain';
    }
  }
  if (state === 'quoted') throw new Error('Unterminated CSV field');
  if (row.length || field || state === 'closed') { finishField(); rows.push(row); }
  if (rows.some((r) => r.length !== rows[0].length)) throw new Error('CSV field count mismatch');
  return rows;
}
