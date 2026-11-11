-- SCORM Objectives
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMObjectives` (
    `ObjectiveId` STRING(36),
    `ScormObjectId` STRING(36),
    `ObjectiveType` STRING(100),
    `ActivityId` STRING(36),
    `InternalId` STRING(255),
    `IsPrimary` BOOL,
    `Description` STRING(250),
    `ScoreMin` FLOAT64,
    `ScoreMax` FLOAT64,
    `LastModified` DATETIME
);
