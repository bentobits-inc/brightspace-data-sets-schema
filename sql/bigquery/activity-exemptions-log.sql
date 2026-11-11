-- Activity Exemptions Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityExemptionsLog` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `ObjectId` INT64,
    `ActivityId` STRING(225),
    `LogTypeName` STRING(50),
    `LastModifiedUtc` DATETIME,
    `LastModifiedBy` INT64,
    `ActivityExemptionsLogId` INT64,
    `ToolId` INT64
);
