-- LTI Advantage Deployment Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageDeploymentAudit" (
    "Action" varchar(10),
    "DeploymentID" varchar(36),
    "ClientID" varchar(36),
    "DeploymentName" varchar(200),
    "IsDeploymentEnabled" boolean,
    "HasAssignmentsAndGrades" boolean,
    "HasDeepLinking" boolean,
    "HasNamesAndRoles" boolean,
    "HasSubmissionReview" boolean,
    "HasActivityItemProfile" boolean,
    "HasPlatformNotificationService" boolean,
    "HasContextCopy" boolean,
    "ModifiedBy" bigint,
    "Anonymous" boolean,
    "PreProvisioningEnabled" boolean,
    "SendOrgUnitInfo" boolean,
    "SendUserFirstName" boolean,
    "SendUserMiddleName" boolean,
    "SendUserLastName" boolean,
    "SendUserEmail" boolean,
    "SendBrightspaceUserID" boolean,
    "SendBrightspaceUsername" boolean,
    "SendBrightspaceOrgDefinedId" boolean,
    "SendLinkTitle" boolean,
    "SendLinkDescription" boolean,
    "OpenAsExternal" boolean,
    "AutoMigrateLinks" boolean,
    "IsSharedToManyOrgUnits" boolean,
    "AutoCreateGrades" boolean,
    "IncludeInFinalGrade" boolean,
    "Timestamp" timestamp,
    "HasAssetProcessor" boolean
);
