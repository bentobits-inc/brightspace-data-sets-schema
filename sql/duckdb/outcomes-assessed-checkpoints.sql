-- Outcomes Assessed Checkpoints
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS "OutcomesAssessedCheckpoints" (
    "CheckpointId" UUID,
    "DemonstrationId" UUID,
    "Feedback" VARCHAR,
    "ConfigDecayRate" INTEGER,
    "ConfigAggregationMethod" INTEGER,
    "ConfigIncludedActivities" INTEGER,
    "ConfigMultipleAttemptStrategy" INTEGER,
    "ConfigRecentlyAssessedActivityCount" INTEGER,
    "ConfigTieBreaker" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "HasMetAchievementThreshold" BOOLEAN,
    "AchievedLevelId" UUID
);
