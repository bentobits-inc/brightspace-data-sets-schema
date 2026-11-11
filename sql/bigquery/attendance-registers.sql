-- Attendance Registers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceRegisters` (
    `AttendanceRegisterId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(128),
    `Description` STRING(1000),
    `SchemeId` INT64,
    `IsVisible` BOOL,
    `IncludeAllUsers` BOOL,
    `CauseForConcern` NUMERIC(19,9),
    `Version` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);
