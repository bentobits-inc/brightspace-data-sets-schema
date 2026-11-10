-- Virtual Classroom Usage
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[VirtualClassroomUsage];
CREATE TABLE [dbo].[VirtualClassroomUsage] (
    [OrgUnitId] int NULL,
    [CourseName] nvarchar(255) NULL,
    [MeetingId] nvarchar(36) NULL,
    [MeetingName] nvarchar(255) NULL,
    [CreationUserId] int NULL,
    [CreationDate] datetime2 NULL,
    [ScheduledDate] datetime2 NULL,
    [ScheduledDuration] int NULL,
    [IsPublished] bit NULL,
    [ExternalLinksEnabled] bit NULL,
    [WholeClassInvited] bit NULL,
    [IsCancelled] bit NULL,
    [StartDateTime] datetime2 NULL,
    [EndDateTime] datetime2 NULL,
    [IsRecorded] bit NULL
);
