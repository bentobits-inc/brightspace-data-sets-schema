-- Competency Activity Results
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CompetencyActivityResults];
CREATE TABLE [dbo].[CompetencyActivityResults] (
    [ActivityId] bigint NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [LearningObjectId] bigint NULL,
    [IsAchieved] bit NULL,
    [PercentAchieved] decimal(19,9) NULL,
    [RubricScore] decimal(19,9) NULL,
    [RubricLevelAchieved] nvarchar(256) NULL,
    [RubricId] bigint NULL,
    [RubricCriterionId] bigint NULL,
    [AchievedDate] datetime2 NULL,
    [Version] bigint NULL
);
