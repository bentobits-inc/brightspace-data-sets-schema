-- Checklist Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[ChecklistObjects]', N'U') IS NULL
CREATE TABLE [dbo].[ChecklistObjects] (
    [ChecklistId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [SharedUserId] int NULL,
    [DisplayInNewWindow] bit NULL,
    [SortOrder] int NULL,
    [Version] bigint NULL,
    [ResultId] int NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);
