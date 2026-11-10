-- Quiz Attempts Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[QuizAttemptsLog]', N'U') IS NULL
CREATE TABLE [dbo].[QuizAttemptsLog] (
    [LogId] bigint NULL,
    [AttemptId] bigint NULL,
    [EventTypeId] int NULL,
    [Name] nvarchar(256) NULL,
    [Description] nvarchar(256) NULL,
    [EventTime] datetime2 NULL,
    [IPAddress] varchar(45) NULL,
    [UserId] int NULL,
    [IsDeleted] bit NULL
);
