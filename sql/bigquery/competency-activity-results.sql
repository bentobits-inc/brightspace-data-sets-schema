-- Competency Activity Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CompetencyActivityResults` (
    `ActivityId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `LearningObjectId` INT64,
    `IsAchieved` BOOL,
    `PercentAchieved` NUMERIC(19,9),
    `RubricScore` NUMERIC(19,9),
    `RubricLevelAchieved` STRING(256),
    `RubricId` INT64,
    `RubricCriterionId` INT64,
    `AchievedDate` DATETIME,
    `Version` INT64
);
