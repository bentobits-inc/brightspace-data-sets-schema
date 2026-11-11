-- Outcomes Aligned to Tool Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesAlignedToToolObjects" (
    "ObjectType" integer,
    "ObjectId" varchar(255),
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "AIUtilization" integer
);
