-- Calendar Events
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[CalendarEvents]', N'U') IS NULL
CREATE TABLE [dbo].[CalendarEvents] (
    [ScheduleId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [UserId] bigint NULL,
    [Title] nvarchar(256) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [TimeZoneIdentifier] varchar(256) NULL,
    [IsAllDayEvent] bit NULL,
    [RecurrenceType] varchar(7) NULL,
    [RecurrenceInterval] int NULL,
    [CreatedByUserId] int NULL,
    [LastModified] datetime2 NULL,
    [EventObjectTypeName] nvarchar(200) NULL,
    [ObjectLookupId1] bigint NULL,
    [ObjectLookupId2] bigint NULL
);
