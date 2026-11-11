-- Calendar Events
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CalendarEvents` (
    `ScheduleId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `Title` STRING(256),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `TimeZoneIdentifier` STRING(256),
    `IsAllDayEvent` BOOL,
    `RecurrenceType` STRING(7),
    `RecurrenceInterval` INT64,
    `CreatedByUserId` INT64,
    `LastModified` DATETIME,
    `EventObjectTypeName` STRING(200),
    `ObjectLookupId1` INT64,
    `ObjectLookupId2` INT64
);
