-- Attendance Schemes
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceSchemes" (
    "SchemeId" BIGINT,
    "OrgUnitId" INT,
    "SchemeName" VARCHAR(128),
    "SchemeSymbolId" BIGINT,
    "SymbolName" VARCHAR(128),
    "SymbolValue" VARCHAR(50),
    "Percentage" NUMBER(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);
