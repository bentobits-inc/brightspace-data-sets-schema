-- Announcements
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[Announcements];
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
