-- LTI Advantage Registration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" VARCHAR,
    "ClientId" VARCHAR,
    "ToolName" VARCHAR,
    "Domain" VARCHAR,
    "RedirectURLs" VARCHAR,
    "KeysetURL" VARCHAR,
    "LoginURL" VARCHAR,
    "LTIVersion" VARCHAR,
    "IsRegistrationEnabled" BOOLEAN,
    "SendInstitutionRole" BOOLEAN,
    "TargetLinkURI" VARCHAR,
    "ModifiedBy" BIGINT,
    "HasAssignmentAndGradeServices" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoleProvisioningServices" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "Timestamp" TIMESTAMP,
    "HasAssetProcessor" BOOLEAN
);
