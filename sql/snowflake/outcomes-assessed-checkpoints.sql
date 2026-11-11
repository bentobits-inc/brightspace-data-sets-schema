-- Outcomes Assessed Checkpoints
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS "OutcomesAssessedCheckpoints" (
    "CheckpointId" VARCHAR(36),
    "DemonstrationId" VARCHAR(36),
    "Feedback" VARCHAR(1000),
    "ConfigDecayRate" INT,
    "ConfigAggregationMethod" INT,
    "ConfigIncludedActivities" INT,
    "ConfigMultipleAttemptStrategy" INT,
    "ConfigRecentlyAssessedActivityCount" INT,
    "ConfigTieBreaker" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "HasMetAchievementThreshold" BOOLEAN,
    "AchievedLevelId" VARCHAR(36)
);
