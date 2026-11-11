-- Content Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS `ContentObjects` (
    `ContentObjectId` INT64,
    `OrgUnitId` INT64,
    `Title` STRING(150),
    `ContentObjectType` STRING(6),
    `CompletionType` STRING(7),
    `ParentContentObjectId` INT64,
    `Location` STRING(1024),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `ObjectId1` INT64,
    `ObjectId2` INT64,
    `ObjectId3` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL,
    `SortOrder` INT64,
    `Depth` INT64,
    `ToolId` INT64,
    `IsHidden` BOOL,
    `ResultId` INT64,
    `DeletedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedBy` INT64,
    `DeletedBy` INT64,
    `AIUtilization` INT64,
    `Version` INT64
);
