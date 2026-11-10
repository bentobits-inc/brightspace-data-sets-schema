-- Content User Progress
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ContentUserProgress];
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
