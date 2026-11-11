-- Award Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "AwardObjects" (
    "AwardId" bigint,
    "Name" varchar(256),
    "AwardTypeId" integer,
    "Type" varchar(128),
    "Description" varchar(512),
    "ExpiryCalculationType" varchar(128),
    "ExpiryNotificationType" varchar(128),
    "ExpiryDate" timestamp,
    "ImagePath" varchar(1000),
    "CreatedByUserId" bigint,
    "LastModified" timestamp,
    "IsDeleted" boolean,
    "Criteria" varchar(1000)
);
