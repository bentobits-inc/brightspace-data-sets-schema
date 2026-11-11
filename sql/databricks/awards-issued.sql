-- Awards Issued
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): IssuedId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): IssuedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RevokedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AwardsIssued` (
    `AwardId` BIGINT,
    `OrgUnitId` BIGINT,
    `UserId` BIGINT,
    `IssuedBy` INT,
    `IssueDate` TIMESTAMP_NTZ,
    `ExpiryDate` TIMESTAMP_NTZ,
    `IssuedId` BIGINT,
    `Criteria` STRING,
    `Evidence` STRING,
    `RevokedDate` TIMESTAMP_NTZ,
    `RevokedReason` STRING,
    `RevokedBy` BIGINT,
    `LastModifiedBy` BIGINT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `CertificateId` STRING
);
