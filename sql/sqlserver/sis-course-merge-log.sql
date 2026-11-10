-- SIS Course Merge Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SISCourseMergeLog];
CREATE TABLE [dbo].[SISCourseMergeLog] (
    [BatchId] uniqueidentifier NULL,
    [JobType] nvarchar(32) NULL,
    [Status] nvarchar(32) NULL,
    [OriginalTargetOrgUnitId] bigint NULL,
    [OriginalSourceOrgUnitId] bigint NULL,
    [SourceSystemId] bigint NULL,
    [NumberOfCoursesInBatch] int NULL,
    [UserId] bigint NULL,
    [ErrorType] nvarchar(48) NULL,
    [Timestamp] datetime2 NULL
);
