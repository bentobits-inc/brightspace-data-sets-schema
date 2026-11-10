-- Checklist Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ChecklistObjects];
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
