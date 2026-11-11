-- LTI Links
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `LTILinks` (
    `LtiLinkId` BIGINT,
    `OrgUnitId` INT,
    `Title` STRING,
    `LinkType` INT,
    `LTIVersion` STRING,
    `Url` STRING,
    `Description` STRING,
    `IsVisible` BOOLEAN,
    `SendTCInfo` BOOLEAN,
    `SendContextInfo` BOOLEAN,
    `SendCourseInfo` BOOLEAN,
    `SendOrgUnitInfo` BOOLEAN,
    `SendUserId` BOOLEAN,
    `SendUserName` BOOLEAN,
    `SendUserEmail` BOOLEAN,
    `SendLinkTitle` BOOLEAN,
    `SendLinkDescription` BOOLEAN,
    `SendD2LUserName` BOOLEAN,
    `SendD2LOrgDefinedId` BOOLEAN,
    `SendD2LOrgRoleId` BOOLEAN,
    `SendBrightspaceUserId` BOOLEAN,
    `Anonymous` BOOLEAN,
    `Shared` BOOLEAN,
    `UseToolProviderSecuritySettings` BOOLEAN,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `OuAvailabilitySetId` BIGINT,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `DeploymentId` STRING,
    `LinkSubType` INT
);
