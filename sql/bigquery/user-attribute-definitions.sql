-- User Attribute Definitions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserAttributeDefinitions` (
    `AttributeId` STRING(128),
    `Name` STRING(128),
    `Type` STRING(8),
    `AllowMultiple` BOOL,
    `IsDefault` BOOL,
    `LastModified` DATETIME,
    `ModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);
