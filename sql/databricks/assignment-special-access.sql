-- Assignment Special Access
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AssignmentSpecialAccess` (
    `DropboxId` BIGINT,
    `UserId` INT,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `ModifiedBy` INT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `StartDateAvailabilityType` SMALLINT,
    `EndDateAvailabilityType` SMALLINT
);
