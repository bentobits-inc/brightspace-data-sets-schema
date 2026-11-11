-- System Access Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessLog" (
    "SessionId" varchar(36),
    "UserId" integer,
    "Timestamp" timestamp,
    "State" varchar(20),
    "Source" varchar(20),
    "AppVersion" varchar(20),
    "Device" varchar(50),
    "IsOfflineMode" boolean,
    "IPAddress" varchar(45)
);
