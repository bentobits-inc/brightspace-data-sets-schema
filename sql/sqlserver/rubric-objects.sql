-- Rubric Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[RubricObjects]', N'U') IS NULL
CREATE TABLE [dbo].[RubricObjects] (
    [RubricId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [RubricStatus] nvarchar(256) NULL,
    [Description] nvarchar(1000) NULL,
    [RubricType] nvarchar(256) NULL,
    [ScoringMethods] nvarchar(256) NULL,
    [IsScoreVisible] bit NULL,
    [OrgUnitID] int NULL,
    [IsShared] bit NULL,
    [IsDeleted] bit NULL
);
