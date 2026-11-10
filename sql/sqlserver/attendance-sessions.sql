-- Attendance Sessions
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
DROP TABLE IF EXISTS [dbo].[AttendanceSessions];
CREATE TABLE [dbo].[AttendanceSessions] (
    [AttendanceSessionId] bigint NULL,
    [AttendanceRegisterId] bigint NULL,
    [Name] nvarchar(128) NULL,
    [Description] nvarchar(256) NULL,
    [SortOrder] int NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);
