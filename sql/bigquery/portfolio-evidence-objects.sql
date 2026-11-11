-- Portfolio Evidence Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceObjects` (
    `EvidenceId` STRING(36),
    `OwnerId` INT64,
    `OrgUnitId` INT64,
    `EvidenceType` STRING(30),
    `Title` STRING(1000),
    `IsApproved` BOOL,
    `IsSpotlighted` BOOL,
    `IsSharedToParents` BOOL,
    `IsDeleted` BOOL,
    `IsRecoverableByInstructor` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsSharedWithInstructor` BOOL,
    `DateSharedWithInstructor` DATETIME
);
