-- Course Publisher Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CoursePublisherLaunches` (
    `LaunchId` STRING,
    `OrgUnitId` INT,
    `RecipientId` STRING,
    `UserId` INT,
    `RoleId` INT,
    `LaunchMethod` STRING,
    `ExternalUserId` STRING,
    `ExternalLMSType` STRING,
    `IsNewUser` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ
);
