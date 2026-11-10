-- Virtual Classroom Usage
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[VirtualClassroomUsage]', N'U') IS NULL
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
