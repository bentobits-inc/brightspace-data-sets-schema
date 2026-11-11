-- Attendance Schemes
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceSchemes` (
    `SchemeId` INT64,
    `OrgUnitId` INT64,
    `SchemeName` STRING(128),
    `SchemeSymbolId` INT64,
    `SymbolName` STRING(128),
    `SymbolValue` STRING(50),
    `Percentage` NUMERIC(19,9),
    `Version` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);
