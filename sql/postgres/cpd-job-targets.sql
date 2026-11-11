-- CPD Job Targets
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS "CPDJobTargets" (
    "PrincipalId" integer,
    "CategoryId" integer,
    "JobTitle" varchar(256),
    "StructuredMinutes" integer,
    "UnstructuredMinutes" integer,
    "StructuredRecordCount" integer,
    "UnstructuredRecordCount" integer,
    "StartDate" timestamp,
    "DateDeleted" timestamp,
    "LastModified" timestamp,
    "Version" bigint
);
