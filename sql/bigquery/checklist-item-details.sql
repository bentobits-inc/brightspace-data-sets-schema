-- Checklist Item Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistItemDetails` (
    `ItemId` INT64,
    `CategoryId` INT64,
    `Name` STRING(512),
    `Description` STRING(1000),
    `DescriptionIsHtml` BOOL,
    `DueDate` DATETIME,
    `ScheduleId` INT64,
    `SortOrder` INT64,
    `IsAutoChecked` BOOL,
    `LastModifiedUtc` DATETIME,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64,
    `Version` INT64
);
