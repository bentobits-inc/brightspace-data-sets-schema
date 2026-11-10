-- Course Copy Logs
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[CourseCopyLogs]', N'U') IS NULL
CREATE TABLE [dbo].[CourseCopyLogs] (
    [SourceOrgUnitId] int NULL,
    [DestinationOrgUnitId] int NULL,
    [UserId] bigint NULL,
    [Status] varchar(128) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsDestinationNew] bit NULL,
    [CopyProtectedResources] bit NULL,
    [CopyCourseJobId] bigint NULL,
    [StatusId] int NULL
);
