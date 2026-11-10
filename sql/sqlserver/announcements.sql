-- Announcements
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[Announcements]', N'U') IS NULL
CREATE TABLE [dbo].[Announcements] (
    [AnnouncementId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [Title] nvarchar(400) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsGlobal] bit NULL,
    [IsDraft] bit NULL,
    [NumAttachments] int NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [CreatedBy] int NULL,
    [IsAuthorInfoShown] bit NULL,
    [CreatedDate] datetime2 NULL,
    [ResultId] bigint NULL
);
