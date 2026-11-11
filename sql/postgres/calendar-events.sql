-- Calendar Events
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CalendarEvents" (
    "ScheduleId" bigint,
    "OrgUnitId" bigint,
    "UserId" bigint,
    "Title" varchar(256),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "TimeZoneIdentifier" varchar(256),
    "IsAllDayEvent" boolean,
    "RecurrenceType" varchar(7),
    "RecurrenceInterval" integer,
    "CreatedByUserId" integer,
    "LastModified" timestamp,
    "EventObjectTypeName" varchar(200),
    "ObjectLookupId1" bigint,
    "ObjectLookupId2" bigint
);
