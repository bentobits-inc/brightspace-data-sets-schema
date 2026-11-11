-- Media Consumption Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "MediaConsumptionLog" (
    "LogId" uuid,
    "UserId" integer,
    "ContentId" uuid,
    "RevisionId" uuid,
    "ContentType" varchar(5),
    "ClientApp" varchar(32),
    "DateConsumed" timestamp,
    "DurationPercentageWatched" integer
);
