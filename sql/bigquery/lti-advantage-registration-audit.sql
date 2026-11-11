-- LTI Advantage Registration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageRegistrationAudit` (
    `Action` STRING(10),
    `ClientId` STRING(255),
    `ToolName` STRING(200),
    `Domain` STRING(2083),
    `RedirectURLs` STRING(2083),
    `KeysetURL` STRING(255),
    `LoginURL` STRING(255),
    `LTIVersion` STRING(12),
    `IsRegistrationEnabled` BOOL,
    `SendInstitutionRole` BOOL,
    `TargetLinkURI` STRING(255),
    `ModifiedBy` INT64,
    `HasAssignmentAndGradeServices` BOOL,
    `HasSubmissionReview` BOOL,
    `HasDeepLinking` BOOL,
    `HasNamesAndRoleProvisioningServices` BOOL,
    `HasActivityItemProfile` BOOL,
    `HasPlatformNotificationService` BOOL,
    `Timestamp` DATETIME,
    `HasAssetProcessor` BOOL
);
