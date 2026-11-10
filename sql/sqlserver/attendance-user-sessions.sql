-- Attendance User Sessions
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
DROP TABLE IF EXISTS [dbo].[AttendanceUserSessions];
CREATE TABLE [dbo].[AttendanceUserSessions] (
    [UserId] int NULL,
    [AttendanceSessionId] bigint NULL,
    [SchemeSymbolId] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
