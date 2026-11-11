-- SCORM Activity Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMActivityAttempts" (
    "VisitId" VARCHAR(36),
    "ActivityId" VARCHAR(36),
    "AttemptNumber" INT,
    "Completion" VARCHAR(100),
    "Success" VARCHAR(100),
    "Score" FLOAT,
    "ScoreRaw" FLOAT,
    "TimeSpent" FLOAT,
    "Progress" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);
