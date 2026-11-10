-- User Logins
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[UserLogins]', N'U') IS NULL
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
