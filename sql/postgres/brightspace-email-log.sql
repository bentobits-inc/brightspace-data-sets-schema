-- Brightspace Email Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "BrightspaceEmailLog" (
    "MailId" integer,
    "SenderUserId" integer,
    "SenderAddress" varchar(256),
    "RecipientAddress" varchar(256),
    "RecipientType" varchar(4),
    "DateTimeSent" timestamp,
    "Subject" varchar(1000)
);
