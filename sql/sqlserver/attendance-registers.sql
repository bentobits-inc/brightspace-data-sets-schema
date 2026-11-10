-- Attendance Registers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[AttendanceRegisters]', N'U') IS NULL
CREATE TABLE [dbo].[AttendanceRegisters] (
    [AttendanceRegisterId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(128) NULL,
    [Description] nvarchar(1000) NULL,
    [SchemeId] bigint NULL,
    [IsVisible] bit NULL,
    [IncludeAllUsers] bit NULL,
    [CauseForConcern] decimal(19,9) NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);
