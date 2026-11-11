-- LTI Link Migration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTILinkMigrationAudit` (
    `LTIMigrationId` STRING,
    `UserId` BIGINT,
    `MigrationDate` TIMESTAMP_NTZ,
    `OrgUnitId` BIGINT,
    `LinkId` BIGINT,
    `LinkURL` STRING,
    `LinkName` STRING,
    `ClientId` STRING,
    `RegistrationDomain` STRING,
    `DeploymentId` STRING,
    `JobId` BIGINT,
    `Status` SMALLINT,
    `FailureCode` SMALLINT,
    `MigrationType` SMALLINT,
    `LegacyURL` STRING
);
