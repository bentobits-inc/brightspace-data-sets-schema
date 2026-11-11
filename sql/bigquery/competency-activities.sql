-- Competency Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyActivities` (
    `ActivityId` INT64,
    `OrgUnitId` INT64,
    `ActivityName` STRING(256),
    `ActivityTypeId` INT64,
    `AssessmentType` STRING(7),
    `ObjectLookupId` INT64,
    `RubricId` INT64,
    `LevelId` INT64,
    `RubricCriterionId` INT64,
    `AssessmentThresholdCriteria` STRING(2),
    `AssessmentThreshold` NUMERIC(19,9),
    `IsAutoEval` BOOL,
    `RubricName` STRING(256),
    `RubricLevelRequired` STRING(256),
    `ObjectId` INT64,
    `ActivityType` STRING(50),
    `Version` INT64
);
