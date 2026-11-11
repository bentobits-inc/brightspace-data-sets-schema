-- Attendance Registers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceRegisters" (
    "AttendanceRegisterId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(128),
    "Description" VARCHAR(1000),
    "SchemeId" BIGINT,
    "IsVisible" BOOLEAN,
    "IncludeAllUsers" BOOLEAN,
    "CauseForConcern" NUMBER(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);
