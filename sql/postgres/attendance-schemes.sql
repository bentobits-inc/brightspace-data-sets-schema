-- Attendance Schemes
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceSchemes" (
    "SchemeId" bigint,
    "OrgUnitId" integer,
    "SchemeName" varchar(128),
    "SchemeSymbolId" bigint,
    "SymbolName" varchar(128),
    "SymbolValue" varchar(50),
    "Percentage" numeric(19,9),
    "Version" bigint,
    "DateDeleted" timestamp,
    "DeletedBy" integer
);
