-- Attendance User Sessions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS "AttendanceUserSessions" (
    "UserId" INTEGER,
    "AttendanceSessionId" BIGINT,
    "SchemeSymbolId" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);
