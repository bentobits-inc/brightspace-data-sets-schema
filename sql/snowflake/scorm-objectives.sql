-- SCORM Objectives
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMObjectives" (
    "ObjectiveId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "ObjectiveType" VARCHAR(100),
    "ActivityId" VARCHAR(36),
    "InternalId" VARCHAR(255),
    "IsPrimary" BOOLEAN,
    "Description" VARCHAR(250),
    "ScoreMin" FLOAT,
    "ScoreMax" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);
