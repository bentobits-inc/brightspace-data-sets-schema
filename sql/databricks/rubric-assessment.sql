-- Rubric Assessment
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `RubricAssessment` (
    `RubricId` BIGINT,
    `OrgUnitId` INT,
    `UserId` INT,
    `Score` DECIMAL(36,2),
    `AssessedByUserId` INT,
    `AssessmentDate` TIMESTAMP_NTZ,
    `IsCompleted` BOOLEAN,
    `ActivityType` STRING,
    `ActivityObjectId` BIGINT,
    `DateCreated` TIMESTAMP_NTZ,
    `AssessmentId` BIGINT,
    `LevelAchievedId` BIGINT,
    `ActivityId` BIGINT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);
