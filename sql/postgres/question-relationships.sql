-- Question Relationships
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionRelationships" (
    "CollectionId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "Order" bigint,
    "SectionId" bigint,
    "IsQuestionPool" boolean,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "Points" numeric(19,9),
    "Difficulty" integer,
    "IsBonus" boolean,
    "IsMandatory" boolean,
    "IsDeleted" boolean,
    "Version" bigint,
    "ObjectId" bigint
);
