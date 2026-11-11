-- Grade Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeObjects` (
    `GradeObjectId` INT,
    `OrgUnitId` INT,
    `ParentGradeObjectId` INT,
    `Name` STRING,
    `TypeName` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsAutoPointed` BOOLEAN,
    `IsFormula` BOOLEAN,
    `IsBonus` BOOLEAN,
    `MaxPoints` DECIMAL(19,9),
    `CanExceedMaxGrade` BOOLEAN,
    `ExcludeFromFinalGradeCalc` BOOLEAN,
    `GradeSchemeId` BIGINT,
    `Weight` DECIMAL(19,9),
    `NumLowestGradesToDrop` INT,
    `NumHighestGradesToDrop` INT,
    `WeightDistributionType` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `ToolName` STRING,
    `AssociatedToolItemId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `ShortName` STRING,
    `GradeObjectTypeId` INT,
    `SortOrder` INT,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `DeletedByUserId` INT,
    `ResultId` INT,
    `ToolId` INT,
    `Version` INT
);
