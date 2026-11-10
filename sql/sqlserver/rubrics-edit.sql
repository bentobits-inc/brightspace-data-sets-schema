-- Rubrics Edit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
IF OBJECT_ID(N'[dbo].[RubricsEdit]', N'U') IS NULL
CREATE TABLE [dbo].[RubricsEdit] (
    [AuditLogId] uniqueidentifier NULL,
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [LevelId] bigint NULL,
    [ModifiedBy] int NULL,
    [ModifiedObjectType] int NULL,
    [CriteriaGroupId] bigint NULL,
    [ModifiedDate] datetime2 NULL,
    [PreviousValue] nvarchar(4000) NULL,
    [ModifiedValue] nvarchar(4000) NULL,
    [IsLocked] bit NULL,
    [Version] int NULL
);
