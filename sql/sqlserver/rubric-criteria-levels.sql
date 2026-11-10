-- Rubric Criteria Levels
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[RubricCriteriaLevels];
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
