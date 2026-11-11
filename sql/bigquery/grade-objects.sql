-- Grade Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeObjects` (
    `GradeObjectId` INT64,
    `OrgUnitId` INT64,
    `ParentGradeObjectId` INT64,
    `Name` STRING(128),
    `TypeName` STRING(50),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsAutoPointed` BOOL,
    `IsFormula` BOOL,
    `IsBonus` BOOL,
    `MaxPoints` NUMERIC(19,9),
    `CanExceedMaxGrade` BOOL,
    `ExcludeFromFinalGradeCalc` BOOL,
    `GradeSchemeId` INT64,
    `Weight` NUMERIC(19,9),
    `NumLowestGradesToDrop` INT64,
    `NumHighestGradesToDrop` INT64,
    `WeightDistributionType` STRING(8),
    `CreatedDate` DATETIME,
    `ToolName` STRING(50),
    `AssociatedToolItemId` INT64,
    `LastModified` DATETIME,
    `ShortName` STRING(128),
    `GradeObjectTypeId` INT64,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `ResultId` INT64,
    `ToolId` INT64,
    `Version` INT64
);
