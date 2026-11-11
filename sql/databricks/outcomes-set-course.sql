-- Outcomes Set Course
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesSetCourse` (
    `RegistryId` STRING,
    `OrgUnitId` BIGINT,
    `SourceOutcomeSetId` BIGINT,
    `IsPrimary` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `ScaleId` STRING,
    `AchievementThreshold` STRING
);
