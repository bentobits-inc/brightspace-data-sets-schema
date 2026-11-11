-- SCORM Activity Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMActivityAttempts` (
    `VisitId` STRING(36),
    `ActivityId` STRING(36),
    `AttemptNumber` INT64,
    `Completion` STRING(100),
    `Success` STRING(100),
    `Score` FLOAT64,
    `ScoreRaw` FLOAT64,
    `TimeSpent` FLOAT64,
    `Progress` FLOAT64,
    `LastModified` DATETIME
);
