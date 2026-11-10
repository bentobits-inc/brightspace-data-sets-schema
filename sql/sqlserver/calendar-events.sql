-- Calendar Events
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CalendarEvents];
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
