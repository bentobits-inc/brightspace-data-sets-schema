-- Calendar Events
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CalendarEvents" (
    "ScheduleId" BIGINT,
    "OrgUnitId" BIGINT,
    "UserId" BIGINT,
    "Title" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "TimeZoneIdentifier" VARCHAR,
    "IsAllDayEvent" BOOLEAN,
    "RecurrenceType" VARCHAR,
    "RecurrenceInterval" INTEGER,
    "CreatedByUserId" INTEGER,
    "LastModified" TIMESTAMP,
    "EventObjectTypeName" VARCHAR,
    "ObjectLookupId1" BIGINT,
    "ObjectLookupId2" BIGINT
);
