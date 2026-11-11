-- Checklist Category Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCategoryDetails" (
    "CategoryId" BIGINT,
    "ChecklistId" BIGINT,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "DescriptionIsHtml" BOOLEAN,
    "SortOrder" INTEGER,
    "LastModifiedUtc" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER,
    "Version" BIGINT
);
