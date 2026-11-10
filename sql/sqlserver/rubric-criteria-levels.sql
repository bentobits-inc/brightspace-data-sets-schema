-- Rubric Criteria Levels
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[RubricCriteriaLevels]', N'U') IS NULL
CREATE TABLE [dbo].[RubricCriteriaLevels] (
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [Description] nvarchar(1000) NULL,
    [Feedback] nvarchar(1000) NULL,
    [Value] decimal(19,9) NULL,
    [LevelId] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
