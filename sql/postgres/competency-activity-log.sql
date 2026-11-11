-- Competency Activity Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityLog" (
    "ActivityId" bigint,
    "ActivityLogId" bigint,
    "LogTypeId" integer,
    "LogTypeName" varchar(19),
    "LogDateTime" timestamp,
    "ModifiedBy" bigint
);
