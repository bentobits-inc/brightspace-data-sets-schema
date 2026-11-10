-- Audio Video Processed
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
IF OBJECT_ID(N'[dbo].[AudioVideoProcessed]', N'U') IS NULL
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
