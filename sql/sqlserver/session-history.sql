-- Session History
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SessionHistory];
CREATE TABLE [dbo].[SessionHistory] (
    [SessionId] bigint NULL,
    [OrgId] int NULL,
    [UserId] int NULL,
    [DateStarted] datetime2 NULL,
    [DateEnded] datetime2 NULL,
    [LastAccessed] datetime2 NULL,
    [TimedOut] bit NULL,
    [HistoryID] bigint NULL
);
