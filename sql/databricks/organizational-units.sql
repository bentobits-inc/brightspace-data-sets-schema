-- Organizational Units
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `OrganizationalUnits` (
    `OrgUnitId` INT,
    `Organization` STRING,
    `Type` STRING,
    `Name` STRING,
    `Code` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsActive` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `RecycledDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `OrgUnitTypeId` INT
);
