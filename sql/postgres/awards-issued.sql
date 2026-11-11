-- Awards Issued
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): IssuedId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): IssuedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RevokedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AwardsIssued" (
    "AwardId" bigint,
    "OrgUnitId" bigint,
    "UserId" bigint,
    "IssuedBy" integer,
    "IssueDate" timestamp,
    "ExpiryDate" timestamp,
    "IssuedId" bigint,
    "Criteria" varchar(1000),
    "Evidence" varchar(1000),
    "RevokedDate" timestamp,
    "RevokedReason" varchar(1000),
    "RevokedBy" bigint,
    "LastModifiedBy" bigint,
    "LastModifiedDate" timestamp,
    "Version" bigint,
    "CertificateId" varchar(12)
);
