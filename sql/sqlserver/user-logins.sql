-- User Logins
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserLogins];
CREATE TABLE [dbo].[UserLogins] (
    [UserId] int NULL,
    [UserName] nvarchar(256) NULL,
    [IP] varchar(64) NULL,
    [SessionId] int NULL,
    [StatusType] nvarchar(50) NULL,
    [AttemptDate] datetime2 NULL,
    [ImpersonatingUserId] int NULL,
    [LoginAttemptId] nvarchar(36) NULL,
    [LoginSource] nvarchar(50) NULL
);
