-- Attendance Sessions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
IF OBJECT_ID(N'[dbo].[AttendanceSessions]', N'U') IS NULL
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
