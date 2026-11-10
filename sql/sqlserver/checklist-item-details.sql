-- Checklist Item Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[ChecklistItemDetails]', N'U') IS NULL
CREATE TABLE [dbo].[ChecklistItemDetails] (
    [ItemId] bigint NULL,
    [CategoryId] bigint NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [DueDate] datetime2 NULL,
    [ScheduleId] int NULL,
    [SortOrder] int NULL,
    [IsAutoChecked] bit NULL,
    [LastModifiedUtc] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);
