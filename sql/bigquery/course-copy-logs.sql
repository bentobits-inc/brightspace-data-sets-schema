-- Course Copy Logs
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseCopyLogs` (
    `SourceOrgUnitId` INT64,
    `DestinationOrgUnitId` INT64,
    `UserId` INT64,
    `Status` STRING(128),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsDestinationNew` BOOL,
    `CopyProtectedResources` BOOL,
    `CopyCourseJobId` INT64,
    `StatusId` INT64
);
