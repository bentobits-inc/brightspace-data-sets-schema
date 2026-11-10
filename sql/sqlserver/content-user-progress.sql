-- Content User Progress
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[ContentUserProgress]', N'U') IS NULL
CREATE TABLE [dbo].[ContentUserProgress] (
    [ContentObjectId] int NULL,
    [UserId] int NULL,
    [CompletedDate] datetime2 NULL,
    [LastVisited] datetime2 NULL,
    [IsRead] bit NULL,
    [NumRealVisits] int NULL,
    [NumFakeVisits] int NULL,
    [TotalTime] bigint NULL,
    [IsVisited] bit NULL,
    [IsCurrentBookmark] bit NULL,
    [IsSelfAssessComplete] bit NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);
