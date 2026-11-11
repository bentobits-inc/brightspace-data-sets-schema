-- Outcome Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomeDetails" (
    "OutcomeId" UUID,
    "OutcomeDefinitionSource" VARCHAR,
    "OutcomeDefinitionId" VARCHAR,
    "ParentOutcomeId" UUID,
    "Description" VARCHAR,
    "Notation" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);
