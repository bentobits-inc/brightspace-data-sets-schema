-- Source Course Deploy History
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SourceCourseDeployHistory];
CREATE TABLE [dbo].[SourceCourseDeployHistory] (
    [SourceCourseDeployId] bigint NULL,
    [SourceCourseOrgUnitId] int NULL,
    [TargetCourseOrgUnitId] int NULL,
    [UserId] int NULL,
    [Status] nvarchar(128) NULL,
    [QueuedTime] datetime2 NULL,
    [CompletionTime] datetime2 NULL
);
