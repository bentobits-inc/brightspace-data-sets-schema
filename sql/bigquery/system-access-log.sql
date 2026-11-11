-- System Access Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SystemAccessLog` (
    `SessionId` STRING(36),
    `UserId` INT64,
    `Timestamp` DATETIME,
    `State` STRING(20),
    `Source` STRING(20),
    `AppVersion` STRING(20),
    `Device` STRING(50),
    `IsOfflineMode` BOOL,
    `IPAddress` STRING(45)
);
