-- Rubric Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "RubricObjects" (
    "RubricId" BIGINT,
    "Name" VARCHAR(256),
    "RubricStatus" VARCHAR(256),
    "Description" VARCHAR(1000),
    "RubricType" VARCHAR(256),
    "ScoringMethods" VARCHAR(256),
    "IsScoreVisible" BOOLEAN,
    "OrgUnitID" INT,
    "IsShared" BOOLEAN,
    "IsDeleted" BOOLEAN
);
