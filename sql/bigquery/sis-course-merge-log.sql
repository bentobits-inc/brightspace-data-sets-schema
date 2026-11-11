-- SIS Course Merge Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SISCourseMergeLog` (
    `BatchId` STRING(36),
    `JobType` STRING(32),
    `Status` STRING(32),
    `OriginalTargetOrgUnitId` INT64,
    `OriginalSourceOrgUnitId` INT64,
    `SourceSystemId` INT64,
    `NumberOfCoursesInBatch` INT64,
    `UserId` INT64,
    `ErrorType` STRING(48),
    `Timestamp` DATETIME
);
