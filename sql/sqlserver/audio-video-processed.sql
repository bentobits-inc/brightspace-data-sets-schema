-- Audio Video Processed
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
DROP TABLE IF EXISTS [dbo].[AudioVideoProcessed];
CREATE TABLE [dbo].[AudioVideoProcessed] (
    [ContentId] uniqueidentifier NULL,
    [RevisionId] uniqueidentifier NULL,
    [RevisionNumber] int NULL,
    [Type] nvarchar(5) NULL,
    [Source] nvarchar(32) NULL,
    [RevisionSize] bigint NULL,
    [Duration] int NULL,
    [RequiredTranscoding] bit NULL,
    [RequiredTranscribing] bit NULL,
    [LastModified] datetime2 NULL
);
