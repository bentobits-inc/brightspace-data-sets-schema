-- Outcome Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomeDetails" (
    "OutcomeId" VARCHAR(36),
    "OutcomeDefinitionSource" VARCHAR(1000),
    "OutcomeDefinitionId" VARCHAR(128),
    "ParentOutcomeId" VARCHAR(36),
    "Description" VARCHAR(1000),
    "Notation" VARCHAR(1000),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);
