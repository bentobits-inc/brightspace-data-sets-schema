-- Media Consumption Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[MediaConsumptionLog]', N'U') IS NULL
CREATE TABLE [dbo].[MediaConsumptionLog] (
    [LogId] uniqueidentifier NULL,
    [UserId] int NULL,
    [ContentId] uniqueidentifier NULL,
    [RevisionId] uniqueidentifier NULL,
    [ContentType] nvarchar(5) NULL,
    [ClientApp] nvarchar(32) NULL,
    [DateConsumed] datetime2 NULL,
    [DurationPercentageWatched] int NULL
);
