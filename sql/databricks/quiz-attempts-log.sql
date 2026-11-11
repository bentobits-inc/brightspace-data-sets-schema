-- Quiz Attempts Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttemptsLog` (
    `LogId` BIGINT,
    `AttemptId` BIGINT,
    `EventTypeId` INT,
    `Name` STRING,
    `Description` STRING,
    `EventTime` TIMESTAMP_NTZ,
    `IPAddress` STRING,
    `UserId` INT,
    `IsDeleted` BOOLEAN
);
