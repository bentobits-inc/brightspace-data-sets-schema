-- Award Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "AwardObjects" (
    "AwardId" BIGINT,
    "Name" VARCHAR,
    "AwardTypeId" INTEGER,
    "Type" VARCHAR,
    "Description" VARCHAR,
    "ExpiryCalculationType" VARCHAR,
    "ExpiryNotificationType" VARCHAR,
    "ExpiryDate" TIMESTAMP,
    "ImagePath" VARCHAR,
    "CreatedByUserId" BIGINT,
    "LastModified" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "Criteria" VARCHAR
);
