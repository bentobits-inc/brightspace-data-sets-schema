-- Outcomes Assessed Checkpoints
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
DROP TABLE IF EXISTS [dbo].[OutcomesAssessedCheckpoints];
CREATE TABLE [dbo].[OutcomesAssessedCheckpoints] (
    [CheckpointId] uniqueidentifier NULL,
    [DemonstrationId] uniqueidentifier NULL,
    [Feedback] nvarchar(1000) NULL,
    [ConfigDecayRate] int NULL,
    [ConfigAggregationMethod] int NULL,
    [ConfigIncludedActivities] int NULL,
    [ConfigMultipleAttemptStrategy] int NULL,
    [ConfigRecentlyAssessedActivityCount] int NULL,
    [ConfigTieBreaker] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [HasMetAchievementThreshold] bit NULL,
    [AchievedLevelId] uniqueidentifier NULL
);
