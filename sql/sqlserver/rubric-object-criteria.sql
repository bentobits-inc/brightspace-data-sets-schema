-- Rubric Object Criteria
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricObjectCriteria];
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
