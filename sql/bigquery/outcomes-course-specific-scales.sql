-- Outcomes Course Specific Scales
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesCourseSpecificScales` (
    `OrgUnitId` INT64,
    `RegistryId` STRING(36),
    `ScaleId` STRING(36),
    `AchievementThreshold` STRING(36),
    `CreatedDate` DATETIME,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);
