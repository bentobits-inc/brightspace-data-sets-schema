-- Checklist Category Details
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ChecklistCategoryDetails];
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
