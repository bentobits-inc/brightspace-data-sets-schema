-- LTI Advantage Registration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[LTIAdvantageRegistrationAudit]', N'U') IS NULL
CREATE TABLE [dbo].[LTIAdvantageRegistrationAudit] (
    [Action] nvarchar(10) NULL,
    [ClientId] nvarchar(255) NULL,
    [ToolName] nvarchar(200) NULL,
    [Domain] nvarchar(2083) NULL,
    [RedirectURLs] nvarchar(2083) NULL,
    [KeysetURL] nvarchar(255) NULL,
    [LoginURL] nvarchar(255) NULL,
    [LTIVersion] varchar(12) NULL,
    [IsRegistrationEnabled] bit NULL,
    [SendInstitutionRole] bit NULL,
    [TargetLinkURI] nvarchar(255) NULL,
    [ModifiedBy] bigint NULL,
    [HasAssignmentAndGradeServices] bit NULL,
    [HasSubmissionReview] bit NULL,
    [HasDeepLinking] bit NULL,
    [HasNamesAndRoleProvisioningServices] bit NULL,
    [HasActivityItemProfile] bit NULL,
    [HasPlatformNotificationService] bit NULL,
    [Timestamp] datetime2 NULL,
    [HasAssetProcessor] bit NULL
);
