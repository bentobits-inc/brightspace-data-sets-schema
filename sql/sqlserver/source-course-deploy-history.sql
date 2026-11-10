-- Source Course Deploy History
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[SourceCourseDeployHistory]', N'U') IS NULL
CREATE TABLE [dbo].[SourceCourseDeployHistory] (
    [SourceCourseDeployId] bigint NULL,
    [SourceCourseOrgUnitId] int NULL,
    [TargetCourseOrgUnitId] int NULL,
    [UserId] int NULL,
    [Status] nvarchar(128) NULL,
    [QueuedTime] datetime2 NULL,
    [CompletionTime] datetime2 NULL
);
