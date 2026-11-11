-- SIS Course Merge Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SISCourseMergeLog" (
    "BatchId" VARCHAR(36),
    "JobType" VARCHAR(32),
    "Status" VARCHAR(32),
    "OriginalTargetOrgUnitId" BIGINT,
    "OriginalSourceOrgUnitId" BIGINT,
    "SourceSystemId" BIGINT,
    "NumberOfCoursesInBatch" INT,
    "UserId" BIGINT,
    "ErrorType" VARCHAR(48),
    "Timestamp" TIMESTAMP_NTZ
);
