-- SCORM Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SCORMObjects` (
    `ScormObjectId` STRING(36),
    `OrgUnitId` INT64,
    `ContentObjectId` INT64,
    `ContentServiceContentId` STRING(36),
    `ContentServiceRevisionId` STRING(36),
    `ContentServiceTopicId` STRING(36),
    `Title` STRING(1000),
    `Description` STRING(1000),
    `LearningStandard` STRING(100),
    `LastModified` DATETIME,
    `LastModifiedBy` INT64
);
