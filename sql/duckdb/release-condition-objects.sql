-- Release Condition Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ReleaseConditionObjects" (
    "PreRequisiteId" INTEGER,
    "ResultId" INTEGER,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "IsNegativeCondition" BOOLEAN,
    "PreRequisiteToolId" INTEGER,
    "Id1" INTEGER,
    "Id2" INTEGER,
    "ResultToolId" INTEGER,
    "UsesPercentage" BOOLEAN,
    "OperatorTypeDesc" VARCHAR,
    "Version" BIGINT,
    "Guid1" UUID,
    "Guid2" UUID
);
