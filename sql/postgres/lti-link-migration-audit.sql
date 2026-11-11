-- LTI Link Migration Audit
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTILinkMigrationAudit" (
    "LTIMigrationId" uuid,
    "UserId" bigint,
    "MigrationDate" timestamp,
    "OrgUnitId" bigint,
    "LinkId" bigint,
    "LinkURL" varchar(2000),
    "LinkName" varchar(200),
    "ClientId" varchar(255),
    "RegistrationDomain" varchar(2083),
    "DeploymentId" uuid,
    "JobId" bigint,
    "Status" smallint,
    "FailureCode" smallint,
    "MigrationType" smallint,
    "LegacyURL" varchar(2083)
);
