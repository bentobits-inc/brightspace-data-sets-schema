-- LTI Advantage Deployment Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageDeploymentAudit" (
    "Action" VARCHAR,
    "DeploymentID" VARCHAR,
    "ClientID" VARCHAR,
    "DeploymentName" VARCHAR,
    "IsDeploymentEnabled" BOOLEAN,
    "HasAssignmentsAndGrades" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoles" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "HasContextCopy" BOOLEAN,
    "ModifiedBy" BIGINT,
    "Anonymous" BOOLEAN,
    "PreProvisioningEnabled" BOOLEAN,
    "SendOrgUnitInfo" BOOLEAN,
    "SendUserFirstName" BOOLEAN,
    "SendUserMiddleName" BOOLEAN,
    "SendUserLastName" BOOLEAN,
    "SendUserEmail" BOOLEAN,
    "SendBrightspaceUserID" BOOLEAN,
    "SendBrightspaceUsername" BOOLEAN,
    "SendBrightspaceOrgDefinedId" BOOLEAN,
    "SendLinkTitle" BOOLEAN,
    "SendLinkDescription" BOOLEAN,
    "OpenAsExternal" BOOLEAN,
    "AutoMigrateLinks" BOOLEAN,
    "IsSharedToManyOrgUnits" BOOLEAN,
    "AutoCreateGrades" BOOLEAN,
    "IncludeInFinalGrade" BOOLEAN,
    "Timestamp" TIMESTAMP,
    "HasAssetProcessor" BOOLEAN
);
