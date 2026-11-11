-- Content Files Properties Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ContentFilesPropertiesLog` (
    `OrgUnitId` INT64,
    `ContentObjectId` INT64,
    `Action` STRING(10),
    `FilePath` STRING(10000),
    `FileName` STRING(512),
    `FileExtension` STRING(512),
    `FileSizeBytes` INT64,
    `UploadDate` DATETIME,
    `LastModifiedBy` INT64,
    `LastModified` DATETIME
);
