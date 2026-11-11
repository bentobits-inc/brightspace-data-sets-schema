-- Rubric Assessment
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `RubricAssessment` (
    `RubricId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `Score` BIGNUMERIC(36,2),
    `AssessedByUserId` INT64,
    `AssessmentDate` DATETIME,
    `IsCompleted` BOOL,
    `ActivityType` STRING(50),
    `ActivityObjectId` INT64,
    `DateCreated` DATETIME,
    `AssessmentId` INT64,
    `LevelAchievedId` INT64,
    `ActivityId` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);
