-- LTI Advantage Deployment Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[LTIAdvantageDeploymentAudit]', N'U') IS NULL
CREATE TABLE [dbo].[LTIAdvantageDeploymentAudit] (
    [Action] nvarchar(10) NULL,
    [DeploymentID] nvarchar(36) NULL,
    [ClientID] nvarchar(36) NULL,
    [DeploymentName] nvarchar(200) NULL,
    [IsDeploymentEnabled] bit NULL,
    [HasAssignmentsAndGrades] bit NULL,
    [HasDeepLinking] bit NULL,
    [HasNamesAndRoles] bit NULL,
    [HasSubmissionReview] bit NULL,
    [HasActivityItemProfile] bit NULL,
    [HasPlatformNotificationService] bit NULL,
    [HasContextCopy] bit NULL,
    [ModifiedBy] bigint NULL,
    [Anonymous] bit NULL,
    [PreProvisioningEnabled] bit NULL,
    [SendOrgUnitInfo] bit NULL,
    [SendUserFirstName] bit NULL,
    [SendUserMiddleName] bit NULL,
    [SendUserLastName] bit NULL,
    [SendUserEmail] bit NULL,
    [SendBrightspaceUserID] bit NULL,
    [SendBrightspaceUsername] bit NULL,
    [SendBrightspaceOrgDefinedId] bit NULL,
    [SendLinkTitle] bit NULL,
    [SendLinkDescription] bit NULL,
    [OpenAsExternal] bit NULL,
    [AutoMigrateLinks] bit NULL,
    [IsSharedToManyOrgUnits] bit NULL,
    [AutoCreateGrades] bit NULL,
    [IncludeInFinalGrade] bit NULL,
    [Timestamp] datetime2 NULL,
    [HasAssetProcessor] bit NULL
);
