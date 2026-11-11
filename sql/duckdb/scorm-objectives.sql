-- SCORM Objectives
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMObjectives" (
    "ObjectiveId" UUID,
    "ScormObjectId" UUID,
    "ObjectiveType" VARCHAR,
    "ActivityId" UUID,
    "InternalId" VARCHAR,
    "IsPrimary" BOOLEAN,
    "Description" VARCHAR,
    "ScoreMin" REAL,
    "ScoreMax" REAL,
    "LastModified" TIMESTAMP
);
