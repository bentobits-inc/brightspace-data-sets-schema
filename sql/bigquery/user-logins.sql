-- User Logins
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserLogins` (
    `UserId` INT64,
    `UserName` STRING(256),
    `IP` STRING(64),
    `SessionId` INT64,
    `StatusType` STRING(50),
    `AttemptDate` DATETIME,
    `ImpersonatingUserId` INT64,
    `LoginAttemptId` STRING(36),
    `LoginSource` STRING(50)
);
