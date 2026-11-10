# Brightspace Data Sets schema

A downloadable reference for all 144 Brightspace Data Sets in a pinned snapshot checked on **2026-10-31**. It includes 1,601 columns, source types, key flags, 258 known joins and 102 foreign keys without a known target. D2L changes data sets over time; compare the snapshot with your current exports before using it.

Browse the reference at [Rowseta Data Sets](https://rowseta.com/guides/data-sets).

## Files

| Folder | Contents |
| --- | --- |
| `schema-source/` | Pinned JSON snapshot, source article links, provenance and checksum |
| `csv/datasets/` | One column reference CSV per dataset |
| `csv/` | Combined columns, dataset index, joins and unresolved foreign keys |
| `diagrams/` | [Index of 41 area diagrams](diagrams/README.md), with external table stubs |
| `scripts/` | Offline generator and validation scripts |

## Download a CSV

Open [the dataset index](csv/datasets.csv) to find a slug. Then open its file, for example [users.csv](csv/datasets/users.csv), and use your repository viewer's **Raw** or **Download raw file** action to save it. These CSVs describe columns; they contain no exported learner records.

CSV fields use RFC 4180 quoting with LF record separators. Source columns retain their original order. Each dataset CSV has `dataset,column,position,type,size,primary_key,foreign_key,references_dataset,references_column`. The combined file adds a leading `area` field. Booleans are `true` or `false`. Dataset names are human-readable; reference targets use dataset slugs. When a column has several targets, the two reference fields contain aligned semicolon-separated lists, sorted by target slug and column. An empty reference means no known join, even when the source foreign-key flag is true.

The dataset index uses the first source article as its area and source link. Composite primary keys are semicolon-separated. The unresolved file uses slugs and preserves the distinction between a foreign-key flag and a confirmed target.

## Keys and joins

Source types and sizes are kept exactly as published, so you can map them to any database. Primary keys and joins are informational. BDS keys can repeat across differential files, so build a current, deduplicated view of your exports before relying on a key. A join expresses a known reference, not a guarantee of complete matching rows.

## Rebuild and verify

Use Node 22. The scripts have no dependencies, and all commands below run offline:

```sh
npm run build
npm run check
npm test
```

The generator verifies the [recorded SHA-256](schema-source/SOURCE.md) against the bytes on disk and writes only generated CSVs and diagrams. The snapshot is stored with LF line endings; a CRLF copy fails validation. It uses a fixed random seed and sorts files and relationships by slug. It never refreshes the snapshot. Repeated builds produce the same bytes and LF line endings.

`npm run check` rebuilds in memory to find missing, changed or extra generated files, checks every CSV against the source, validates SVG XML, boxes and exact join edges, and scans files for private details. It also tests the validators with deliberately invalid inputs. `npm test` runs the same checks.

Optionally add `.leak-patterns.local` at the repository root to scan for extra private terms. Use one case-insensitive literal term per line; blank lines and lines starting with `#` are ignored. This file is gitignored, excluded from the scan itself, and never required.

## About and licences

Maintained by BentoBits Inc., the makers of Rowseta. Rowseta provides a browsable Data Sets reference.

This project is not affiliated with or endorsed by D2L. Brightspace is a trademark of D2L Corporation. The schema facts are compiled from [D2L's public Brightspace Data Sets documentation](https://community.d2l.com/brightspace/kb/categories/1229-brightspace-data-sets). The underlying documentation remains D2L's and is linked, not copied.

The [MIT licence](LICENSE) covers `scripts/` and `package.json`. [CC BY 4.0](LICENSE-SCHEMA.md) covers `schema-source/` (the BentoBits compilation of facts from D2L's public documentation), `csv/` and `diagrams/`. Please retain the attribution when sharing the schema compilation.
