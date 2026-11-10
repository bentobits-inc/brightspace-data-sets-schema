-- Attendance User Sessions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
IF OBJECT_ID(N'[dbo].[AttendanceUserSessions]', N'U') IS NULL
CREATE TABLE [dbo].[AttendanceUserSessions] (
    [UserId] int NULL,
    [AttendanceSessionId] bigint NULL,
    [SchemeSymbolId] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
