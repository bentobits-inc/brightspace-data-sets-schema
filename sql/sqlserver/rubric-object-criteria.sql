-- Rubric Object Criteria
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
IF OBJECT_ID(N'[dbo].[RubricObjectCriteria]', N'U') IS NULL
CREATE TABLE [dbo].[RubricObjectCriteria] (
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [Name] nvarchar(500) NULL,
    [SortOrder] int NULL,
    [CriteriaGroupId] bigint NULL,
    [GroupName] nvarchar(256) NULL,
    [GroupSortOrder] int NULL,
    [LevelSetId] bigint NULL,
    [IsDeleted] bit NULL
);
