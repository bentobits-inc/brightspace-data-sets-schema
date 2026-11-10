-- Rubric Object Levels
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricObjectLevels];
CREATE TABLE [dbo].[RubricObjectLevels] (
    [RubricId] bigint NULL,
    [LevelId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [Description] nvarchar(1000) NULL,
    [Feedback] nvarchar(1000) NULL,
    [Value] decimal(19,9) NULL,
    [RangeStartValue] decimal(19,9) NULL,
    [SortOrder] int NULL,
    [LevelSetId] bigint NULL,
    [IsDeleted] bit NULL
);
