-- Award Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `AwardObjects` (
    `AwardId` INT64,
    `Name` STRING(256),
    `AwardTypeId` INT64,
    `Type` STRING(128),
    `Description` STRING(512),
    `ExpiryCalculationType` STRING(128),
    `ExpiryNotificationType` STRING(128),
    `ExpiryDate` DATETIME,
    `ImagePath` STRING(1000),
    `CreatedByUserId` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL,
    `Criteria` STRING(1000)
);
