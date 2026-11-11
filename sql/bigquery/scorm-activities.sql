-- SCORM Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMActivities` (
    `ActivityId` STRING(36),
    `ScormObjectId` STRING(36),
    `ParentActivityId` STRING(36),
    `NumChildren` INT64,
    `InternalId` STRING(255),
    `Title` STRING(200),
    `CompletionThreshold` FLOAT64,
    `PassingScore` FLOAT64,
    `PassingScoreUsed` BOOL,
    `ScoreMin` FLOAT64,
    `ScoreMax` FLOAT64,
    `LastModified` DATETIME
);
