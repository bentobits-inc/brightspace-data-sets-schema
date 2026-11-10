-- Competency Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[CompetencyActivities]', N'U') IS NULL
CREATE TABLE [dbo].[CompetencyActivities] (
    [ActivityId] bigint NULL,
    [OrgUnitId] int NULL,
    [ActivityName] nvarchar(256) NULL,
    [ActivityTypeId] int NULL,
    [AssessmentType] varchar(7) NULL,
    [ObjectLookupId] bigint NULL,
    [RubricId] bigint NULL,
    [LevelId] bigint NULL,
    [RubricCriterionId] bigint NULL,
    [AssessmentThresholdCriteria] varchar(2) NULL,
    [AssessmentThreshold] decimal(19,9) NULL,
    [IsAutoEval] bit NULL,
    [RubricName] nvarchar(256) NULL,
    [RubricLevelRequired] nvarchar(256) NULL,
    [ObjectId] bigint NULL,
    [ActivityType] nvarchar(50) NULL,
    [Version] bigint NULL
);
