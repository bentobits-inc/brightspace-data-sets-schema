-- Virtual Classroom Usage
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `VirtualClassroomUsage` (
    `OrgUnitId` INT64,
    `CourseName` STRING(255),
    `MeetingId` STRING(36),
    `MeetingName` STRING(255),
    `CreationUserId` INT64,
    `CreationDate` DATETIME,
    `ScheduledDate` DATETIME,
    `ScheduledDuration` INT64,
    `IsPublished` BOOL,
    `ExternalLinksEnabled` BOOL,
    `WholeClassInvited` BOOL,
    `IsCancelled` BOOL,
    `StartDateTime` DATETIME,
    `EndDateTime` DATETIME,
    `IsRecorded` BOOL
);
