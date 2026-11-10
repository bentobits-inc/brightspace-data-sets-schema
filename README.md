# Brightspace Data Sets schema

A downloadable reference for all 144 Brightspace Data Sets in a pinned snapshot checked on **2026-10-31**. It includes 1,601 columns, source types, key flags, 258 known joins and 102 foreign keys without a known target. D2L changes data sets over time; compare the snapshot with your current exports before using it.

## Files

| Folder | Contents |
| --- | --- |
| `schema-source/` | Pinned JSON snapshot, source article links, provenance and checksum |
| `csv/datasets/` | One column reference CSV per dataset |
| `csv/` | Combined columns, dataset index, joins and unresolved foreign keys |
| `sql/sqlserver/` | One SQL Server `CREATE TABLE` script per dataset, plus `all-tables.sql` |
| `diagrams/` | [Index of 41 area diagrams](diagrams/README.md), with external table stubs |
| `scripts/` | Offline generator and validation scripts |

## Download a CSV

Open [the dataset index](csv/datasets.csv) to find a slug. Then open its file, for example [users.csv](csv/datasets/users.csv), and use your repository viewer's **Raw** or **Download raw file** action to save it. These CSVs describe columns; they contain no exported learner records.

CSV fields use RFC 4180 quoting with LF record separators. Source columns retain their original order. Each dataset CSV has `dataset,column,position,type,size,primary_key,foreign_key,references_dataset,references_column`. The combined file adds a leading `area` field. Booleans are `true` or `false`. Dataset names are human-readable; reference targets use dataset slugs. When a column has several targets, the two reference fields contain aligned semicolon-separated lists, sorted by target slug and column. An empty reference means no known join, even when the source foreign-key flag is true.

The dataset index uses the first source article as its area and source link. Composite primary keys are semicolon-separated. The unresolved file uses slugs and preserves the distinction between a foreign-key flag and a confirmed target.

## Keys and joins

Source types and sizes are kept exactly as published in the CSVs, so you can map them to any database. Primary keys and joins are informational. BDS keys can repeat across differential files, so build a current, deduplicated view of your exports before relying on a key. A join expresses a known reference, not a guarantee of complete matching rows.

## Accuracy and known limits

The snapshot records three things about relationships: 258 joins with a target, split by kind into 196 key joins and 62 user joins (the kind describes the column, not the evidence), and 102 foreign-key flags with no known target, listed in [unresolved-foreign-keys.csv](csv/unresolved-foreign-keys.csv). It does not record whether a join is stated in D2L's documentation or was inferred, so joins are not separated into documented and inferred in this snapshot, and they are not verified. Treat the unresolved foreign keys as open questions.

Some published type and size pairs look inconsistent. The snapshot keeps the published values, and the SQL scripts use the type:

* Seven `int` columns are published with size 8, and are created as `int`: `cpd-user-records` (`UserId`, `Category`, `Method`, `CreditMinutes`) and `course-publisher-launches` (`OrgUnitId`, `UserId`, `RoleId`).
* One `uniqueidentifier` column, `lti-links` `DeploymentId`, is published with size 36, which is a text length. It is created as `uniqueidentifier`.

Generation checks prove consistency with the snapshot, not factual correctness.

## Load tables into SQL Server

`sql/sqlserver/` has one script per dataset (for example [users.sql](sql/sqlserver/users.sql)) and [all-tables.sql](sql/sqlserver/all-tables.sql), which creates all 144 tables. They target SQL Server 2016 or later and create tables in the `dbo` schema. Table names follow the BDS extract naming, such as `[dbo].[ContentUserProgress]`. Columns keep the source order and the Brightspace types, and every column allows NULL. Text longer than 4,000 characters becomes `nvarchar(max)`.

Create or choose an empty database, then run the script with sqlcmd or open it in SSMS and execute it:

```sh
sqlcmd -S localhost -d YourDatabase -E -b -i sql/sqlserver/all-tables.sql
```

Each script creates its table only if it does not already exist. Running a script again never drops a table or deletes rows, and it does not change a table that already exists. To recreate a table, drop it yourself first.

Primary keys and joins appear as comments only. No key or foreign key constraints are created, because BDS keys can repeat across differential files. The scripts create empty tables. Load the rows from your own BDS CSV extracts, then build a current, deduplicated view.

## Rebuild and verify

Use Node 22. The scripts have no dependencies, and all commands below run offline:

```sh
npm run build
npm run check
npm test
```

The generator verifies the [recorded SHA-256](schema-source/SOURCE.md) against the bytes on disk and writes only generated CSVs, SQL Server scripts and diagrams. The snapshot is stored with LF line endings; a CRLF copy fails validation. It uses a fixed random seed and sorts files and relationships by slug. It never refreshes the snapshot. Repeated builds produce the same bytes and LF line endings.

`npm run check` rebuilds in memory to find missing, changed or extra generated files, checks every CSV and SQL Server script against the source, validates SVG XML, boxes and exact join edges, and scans files for private details. It also tests the validators with deliberately invalid inputs. `npm test` runs the same checks. These checks prove consistency with the snapshot, not factual correctness.

Optionally add `.leak-patterns.local` at the repository root to scan for extra private terms. Use one case-insensitive literal term per line; blank lines and lines starting with `#` are ignored. This file is gitignored, excluded from the scan itself, and never required.

To prove the SQL Server scripts really load, run `npm run check:sqlserver` on Windows with sqlcmd and SQL Server LocalDB installed. It creates a throwaway LocalDB database, runs every script and `all-tables.sql` twice, checks that a row inserted between the runs survives, compares every column with `INFORMATION_SCHEMA.COLUMNS`, and drops the database. It is not part of `npm run check` and skips with a message when sqlcmd or LocalDB is missing.

## Licences and trademarks

To the extent BentoBits Inc. holds copyright or similar rights in the original selection, arrangement and annotations of this compilation, those contributions are licensed under CC BY 4.0. No exclusive rights are claimed in the underlying schema facts. D2L documentation and trademarks are excluded from this licence.

* [CC BY 4.0](LICENSE-SCHEMA.md) covers `schema-source/`, `csv/`, `diagrams/`, this README and the other original documentation. Please retain the attribution when sharing the compilation.
* The [MIT licence](LICENSE) covers all executable scripts: `scripts/`, `package.json` and the generated SQL Server scripts in `sql/`.

Schema metadata was transcribed from the linked D2L documentation. D2L's explanatory text, screenshots and original diagrams are not reproduced. The source is [D2L's public Brightspace Data Sets documentation](https://community.d2l.com/brightspace/kb/categories/1229-brightspace-data-sets).

This project is not affiliated with or endorsed by D2L and uses no D2L logos. Brightspace is a trademark of D2L Corporation. All D2L marks are trademarks of D2L Corporation. See [D2L's trademark list](https://www.d2l.com/legal/trademarks/).

## About

Maintained by BentoBits Inc., maker of Rowseta. A browsable version of this reference is at [Rowseta Data Sets](https://rowseta.com/guides/data-sets).
