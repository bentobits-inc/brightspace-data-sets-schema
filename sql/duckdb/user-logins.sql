-- User Logins
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserLogins" (
    "UserId" INTEGER,
    "UserName" VARCHAR,
    "IP" VARCHAR,
    "SessionId" INTEGER,
    "StatusType" VARCHAR,
    "AttemptDate" TIMESTAMP,
    "ImpersonatingUserId" INTEGER,
    "LoginAttemptId" VARCHAR,
    "LoginSource" VARCHAR
);
