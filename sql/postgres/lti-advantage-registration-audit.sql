-- LTI Advantage Registration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" varchar(10),
    "ClientId" varchar(255),
    "ToolName" varchar(200),
    "Domain" varchar(2083),
    "RedirectURLs" varchar(2083),
    "KeysetURL" varchar(255),
    "LoginURL" varchar(255),
    "LTIVersion" varchar(12),
    "IsRegistrationEnabled" boolean,
    "SendInstitutionRole" boolean,
    "TargetLinkURI" varchar(255),
    "ModifiedBy" bigint,
    "HasAssignmentAndGradeServices" boolean,
    "HasSubmissionReview" boolean,
    "HasDeepLinking" boolean,
    "HasNamesAndRoleProvisioningServices" boolean,
    "HasActivityItemProfile" boolean,
    "HasPlatformNotificationService" boolean,
    "Timestamp" timestamp,
    "HasAssetProcessor" boolean
);
