-- Assignment Summary
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AssignmentSummary` (
    `DropboxId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(128),
    `Category` STRING(128),
    `Type` STRING(10),
    `GradeItemId` INT64,
    `PossibleScore` NUMERIC(19,9),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `IsRestricted` BOOL,
    `IsDeleted` BOOL,
    `TurnItInEnabled` BOOL,
    `IsHidden` BOOL,
    `SortOrder` INT64,
    `SubmissionType` STRING(18),
    `CompletionType` STRING(27),
    `ResultId` INT64,
    `CategoryId` INT64,
    `Version` INT64,
    `StartDateAvailabilityType` INT64,
    `EndDateAvailabilityType` INT64,
    `AIUtilization` INT64,
    `Instructions` STRING(10000)
);
