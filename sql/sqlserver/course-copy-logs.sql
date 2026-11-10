-- Course Copy Logs
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CourseCopyLogs];
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
