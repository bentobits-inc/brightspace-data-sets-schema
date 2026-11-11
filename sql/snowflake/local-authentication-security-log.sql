-- Local Authentication Security Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LocalAuthenticationSecurityLog" (
    "UserId" INT,
    "Action" VARCHAR(70),
    "ModifiedBy" INT,
    "ModifiedDate" TIMESTAMP_NTZ
);
