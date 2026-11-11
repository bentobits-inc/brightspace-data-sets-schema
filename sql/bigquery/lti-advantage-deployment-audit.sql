-- LTI Advantage Deployment Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageDeploymentAudit` (
    `Action` STRING(10),
    `DeploymentID` STRING(36),
    `ClientID` STRING(36),
    `DeploymentName` STRING(200),
    `IsDeploymentEnabled` BOOL,
    `HasAssignmentsAndGrades` BOOL,
    `HasDeepLinking` BOOL,
    `HasNamesAndRoles` BOOL,
    `HasSubmissionReview` BOOL,
    `HasActivityItemProfile` BOOL,
    `HasPlatformNotificationService` BOOL,
    `HasContextCopy` BOOL,
    `ModifiedBy` INT64,
    `Anonymous` BOOL,
    `PreProvisioningEnabled` BOOL,
    `SendOrgUnitInfo` BOOL,
    `SendUserFirstName` BOOL,
    `SendUserMiddleName` BOOL,
    `SendUserLastName` BOOL,
    `SendUserEmail` BOOL,
    `SendBrightspaceUserID` BOOL,
    `SendBrightspaceUsername` BOOL,
    `SendBrightspaceOrgDefinedId` BOOL,
    `SendLinkTitle` BOOL,
    `SendLinkDescription` BOOL,
    `OpenAsExternal` BOOL,
    `AutoMigrateLinks` BOOL,
    `IsSharedToManyOrgUnits` BOOL,
    `AutoCreateGrades` BOOL,
    `IncludeInFinalGrade` BOOL,
    `Timestamp` DATETIME,
    `HasAssetProcessor` BOOL
);
