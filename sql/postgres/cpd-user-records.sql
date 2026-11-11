-- CPD User Records
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserRecords" (
    "RecordId" integer,
    "RecordName" varchar(256),
    "State" varchar(50),
    "UserId" integer,
    "Category" integer,
    "Method" integer,
    "CreditMinutes" integer,
    "Evidence" varchar(4000),
    "Type" varchar(50),
    "Grade" numeric(4,3),
    "DateCompleted" timestamp,
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);
