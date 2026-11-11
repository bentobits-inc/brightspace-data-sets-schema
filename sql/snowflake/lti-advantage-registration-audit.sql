-- LTI Advantage Registration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" VARCHAR(10),
    "ClientId" VARCHAR(255),
    "ToolName" VARCHAR(200),
    "Domain" VARCHAR(2083),
    "RedirectURLs" VARCHAR(2083),
    "KeysetURL" VARCHAR(255),
    "LoginURL" VARCHAR(255),
    "LTIVersion" VARCHAR(12),
    "IsRegistrationEnabled" BOOLEAN,
    "SendInstitutionRole" BOOLEAN,
    "TargetLinkURI" VARCHAR(255),
    "ModifiedBy" BIGINT,
    "HasAssignmentAndGradeServices" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoleProvisioningServices" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "Timestamp" TIMESTAMP_NTZ,
    "HasAssetProcessor" BOOLEAN
);
