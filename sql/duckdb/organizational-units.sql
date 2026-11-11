-- Organizational Units
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "OrganizationalUnits" (
    "OrgUnitId" INTEGER,
    "Organization" VARCHAR,
    "Type" VARCHAR,
    "Name" VARCHAR,
    "Code" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsActive" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "RecycledDate" TIMESTAMP,
    "Version" BIGINT,
    "OrgUnitTypeId" INTEGER
);
