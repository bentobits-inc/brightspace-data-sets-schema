-- Release Condition Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ReleaseConditionObjects` (
    `PreRequisiteId` INT64,
    `ResultId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(64),
    `IsNegativeCondition` BOOL,
    `PreRequisiteToolId` INT64,
    `Id1` INT64,
    `Id2` INT64,
    `ResultToolId` INT64,
    `UsesPercentage` BOOL,
    `OperatorTypeDesc` STRING(3),
    `Version` INT64,
    `Guid1` STRING(36),
    `Guid2` STRING(36)
);
