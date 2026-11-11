-- SCORM Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMActivities" (
    "ActivityId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "ParentActivityId" VARCHAR(36),
    "NumChildren" INT,
    "InternalId" VARCHAR(255),
    "Title" VARCHAR(200),
    "CompletionThreshold" FLOAT,
    "PassingScore" FLOAT,
    "PassingScoreUsed" BOOLEAN,
    "ScoreMin" FLOAT,
    "ScoreMax" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);
