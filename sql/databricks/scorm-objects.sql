-- SCORM Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SCORMObjects` (
    `ScormObjectId` STRING,
    `OrgUnitId` INT,
    `ContentObjectId` INT,
    `ContentServiceContentId` STRING,
    `ContentServiceRevisionId` STRING,
    `ContentServiceTopicId` STRING,
    `Title` STRING,
    `Description` STRING,
    `LearningStandard` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT
);
