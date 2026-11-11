-- LTI Links
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `LTILinks` (
    `LtiLinkId` INT64,
    `OrgUnitId` INT64,
    `Title` STRING(200),
    `LinkType` INT64,
    `LTIVersion` STRING(12),
    `Url` STRING(2000),
    `Description` STRING(1000),
    `IsVisible` BOOL,
    `SendTCInfo` BOOL,
    `SendContextInfo` BOOL,
    `SendCourseInfo` BOOL,
    `SendOrgUnitInfo` BOOL,
    `SendUserId` BOOL,
    `SendUserName` BOOL,
    `SendUserEmail` BOOL,
    `SendLinkTitle` BOOL,
    `SendLinkDescription` BOOL,
    `SendD2LUserName` BOOL,
    `SendD2LOrgDefinedId` BOOL,
    `SendD2LOrgRoleId` BOOL,
    `SendBrightspaceUserId` BOOL,
    `Anonymous` BOOL,
    `Shared` BOOL,
    `UseToolProviderSecuritySettings` BOOL,
    `LastModifiedDate` DATETIME,
    `OuAvailabilitySetId` INT64,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `CreatedDate` DATETIME,
    `DeploymentId` STRING(36),
    `LinkSubType` INT64
);
