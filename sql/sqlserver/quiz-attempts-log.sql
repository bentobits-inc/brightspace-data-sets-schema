-- Quiz Attempts Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[QuizAttemptsLog];
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
