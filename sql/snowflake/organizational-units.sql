-- Organizational Units
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "OrganizationalUnits" (
    "OrgUnitId" INT,
    "Organization" VARCHAR(50),
    "Type" VARCHAR(50),
    "Name" VARCHAR(128),
    "Code" VARCHAR(50),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsActive" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "RecycledDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "OrgUnitTypeId" INT
);
