-- CPD Job Targets
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS `CPDJobTargets` (
    `PrincipalId` INT,
    `CategoryId` INT,
    `JobTitle` STRING,
    `StructuredMinutes` INT,
    `UnstructuredMinutes` INT,
    `StructuredRecordCount` INT,
    `UnstructuredRecordCount` INT,
    `StartDate` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `Version` BIGINT
);
