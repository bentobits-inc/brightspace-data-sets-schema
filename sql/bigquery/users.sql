-- Users
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `Users` (
    `UserId` INT64,
    `UserName` STRING(270),
    `OrgDefinedId` STRING(256),
    `FirstName` STRING(64),
    `MiddleName` STRING(64),
    `LastName` STRING(64),
    `IsActive` BOOL,
    `ExternalEmail` STRING(256),
    `CreationDate` DATETIME,
    `Version` INT64,
    `OrgRoleId` INT64,
    `DateDeleted` DATETIME
);
