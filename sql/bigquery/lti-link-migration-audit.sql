-- LTI Link Migration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTILinkMigrationAudit` (
    `LTIMigrationId` STRING(36),
    `UserId` INT64,
    `MigrationDate` DATETIME,
    `OrgUnitId` INT64,
    `LinkId` INT64,
    `LinkURL` STRING(2000),
    `LinkName` STRING(200),
    `ClientId` STRING(255),
    `RegistrationDomain` STRING(2083),
    `DeploymentId` STRING(36),
    `JobId` INT64,
    `Status` INT64,
    `FailureCode` INT64,
    `MigrationType` INT64,
    `LegacyURL` STRING(2083)
);
