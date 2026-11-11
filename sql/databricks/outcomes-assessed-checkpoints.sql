-- Outcomes Assessed Checkpoints
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS `OutcomesAssessedCheckpoints` (
    `CheckpointId` STRING,
    `DemonstrationId` STRING,
    `Feedback` STRING,
    `ConfigDecayRate` INT,
    `ConfigAggregationMethod` INT,
    `ConfigIncludedActivities` INT,
    `ConfigMultipleAttemptStrategy` INT,
    `ConfigRecentlyAssessedActivityCount` INT,
    `ConfigTieBreaker` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `HasMetAchievementThreshold` BOOLEAN,
    `AchievedLevelId` STRING
);
