-- Organizational Units
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `OrganizationalUnits` (
    `OrgUnitId` INT64,
    `Organization` STRING(50),
    `Type` STRING(50),
    `Name` STRING(128),
    `Code` STRING(50),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsActive` BOOL,
    `CreatedDate` DATETIME,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `RecycledDate` DATETIME,
    `Version` INT64,
    `OrgUnitTypeId` INT64
);
