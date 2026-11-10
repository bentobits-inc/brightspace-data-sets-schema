-- Media Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[MediaObjects]', N'U') IS NULL
CREATE TABLE [dbo].[MediaObjects] (
    [ContentId] uniqueidentifier NULL,
    [Title] nvarchar(1000) NULL,
    [RevisionCount] int NULL,
    [OwnerId] int NULL,
    [LastModified] datetime2 NULL
);
