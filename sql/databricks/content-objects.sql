-- Content Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS `ContentObjects` (
    `ContentObjectId` INT,
    `OrgUnitId` INT,
    `Title` STRING,
    `ContentObjectType` STRING,
    `CompletionType` STRING,
    `ParentContentObjectId` INT,
    `Location` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `ObjectId1` INT,
    `ObjectId2` INT,
    `ObjectId3` INT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `SortOrder` INT,
    `Depth` INT,
    `ToolId` INT,
    `IsHidden` BOOLEAN,
    `ResultId` INT,
    `DeletedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedBy` INT,
    `DeletedBy` INT,
    `AIUtilization` INT,
    `Version` BIGINT
);
