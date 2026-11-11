-- Release Condition Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ReleaseConditionObjects" (
    "PreRequisiteId" integer,
    "ResultId" integer,
    "OrgUnitId" integer,
    "Name" varchar(64),
    "IsNegativeCondition" boolean,
    "PreRequisiteToolId" integer,
    "Id1" integer,
    "Id2" integer,
    "ResultToolId" integer,
    "UsesPercentage" boolean,
    "OperatorTypeDesc" varchar(3),
    "Version" bigint,
    "Guid1" uuid,
    "Guid2" uuid
);
