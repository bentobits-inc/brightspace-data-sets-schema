-- Checklist Category Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[ChecklistCategoryDetails]', N'U') IS NULL
CREATE TABLE [dbo].[ChecklistCategoryDetails] (
    [CategoryId] bigint NULL,
    [ChecklistId] bigint NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [SortOrder] int NULL,
    [LastModifiedUtc] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);
