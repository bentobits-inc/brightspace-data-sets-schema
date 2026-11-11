-- Course Publisher Recipients
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CoursePublisherRecipients" (
    "RecipientID" VARCHAR(36),
    "Name" VARCHAR(256),
    "CreatedAt" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ
);
