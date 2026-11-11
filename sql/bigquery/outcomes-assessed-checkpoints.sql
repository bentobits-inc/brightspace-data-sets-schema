-- Outcomes Assessed Checkpoints
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS `OutcomesAssessedCheckpoints` (
    `CheckpointId` STRING(36),
    `DemonstrationId` STRING(36),
    `Feedback` STRING(1000),
    `ConfigDecayRate` INT64,
    `ConfigAggregationMethod` INT64,
    `ConfigIncludedActivities` INT64,
    `ConfigMultipleAttemptStrategy` INT64,
    `ConfigRecentlyAssessedActivityCount` INT64,
    `ConfigTieBreaker` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `HasMetAchievementThreshold` BOOL,
    `AchievedLevelId` STRING(36)
);
