-- Portfolio Evidence Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceLog` (
    `LogId` STRING(36),
    `ParentObjectId` STRING(36),
    `ObjectId` STRING(36),
    `ObjectType` STRING(40),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `Action` STRING(16),
    `IsMobile` BOOL,
    `ActionDate` DATETIME
);
