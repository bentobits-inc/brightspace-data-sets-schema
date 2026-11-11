-- Rubric Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "RubricObjects" (
    "RubricId" bigint,
    "Name" varchar(256),
    "RubricStatus" varchar(256),
    "Description" varchar(1000),
    "RubricType" varchar(256),
    "ScoringMethods" varchar(256),
    "IsScoreVisible" boolean,
    "OrgUnitID" integer,
    "IsShared" boolean,
    "IsDeleted" boolean
);
