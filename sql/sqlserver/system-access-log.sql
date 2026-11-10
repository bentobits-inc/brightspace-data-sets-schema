-- System Access Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[SystemAccessLog]', N'U') IS NULL
CREATE TABLE [dbo].[SystemAccessLog] (
    [SessionId] nvarchar(36) NULL,
    [UserId] int NULL,
    [Timestamp] datetime2 NULL,
    [State] nvarchar(20) NULL,
    [Source] nvarchar(20) NULL,
    [AppVersion] nvarchar(20) NULL,
    [Device] nvarchar(50) NULL,
    [IsOfflineMode] bit NULL,
    [IPAddress] nvarchar(45) NULL
);
