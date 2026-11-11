-- SCORM Interaction Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMInteractionAttempts" (
    "VisitId" VARCHAR(36),
    "InteractionId" VARCHAR(36),
    "AttemptNumber" INT,
    "ActivityId" VARCHAR(36),
    "Timestamp" TIMESTAMP_NTZ,
    "Response" VARCHAR(1000),
    "Result" VARCHAR(100),
    "NumericResult" FLOAT,
    "TimeSpent" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);
