-- SCORM Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMActivities" (
    "ActivityId" uuid,
    "ScormObjectId" uuid,
    "ParentActivityId" uuid,
    "NumChildren" integer,
    "InternalId" varchar(255),
    "Title" varchar(200),
    "CompletionThreshold" real,
    "PassingScore" real,
    "PassingScoreUsed" boolean,
    "ScoreMin" real,
    "ScoreMax" real,
    "LastModified" timestamp
);
