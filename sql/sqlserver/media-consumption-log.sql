-- Media Consumption Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[MediaConsumptionLog];
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
