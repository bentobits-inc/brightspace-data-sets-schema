-- SCORM Interactions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS "SCORMInteractions" (
    "InteractionId" VARCHAR(36),
    "ActivityId" VARCHAR(36),
    "InternalId" VARCHAR(255),
    "InteractionType" VARCHAR(100),
    "Description" VARCHAR(250),
    "Weighting" FLOAT,
    "CorrectResponses" VARCHAR(2000),
    "LastModified" TIMESTAMP_NTZ
);
