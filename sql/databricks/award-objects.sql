-- Award Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `AwardObjects` (
    `AwardId` BIGINT,
    `Name` STRING,
    `AwardTypeId` INT,
    `Type` STRING,
    `Description` STRING,
    `ExpiryCalculationType` STRING,
    `ExpiryNotificationType` STRING,
    `ExpiryDate` TIMESTAMP_NTZ,
    `ImagePath` STRING,
    `CreatedByUserId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `Criteria` STRING
);
