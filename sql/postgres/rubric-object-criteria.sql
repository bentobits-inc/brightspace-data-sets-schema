-- Rubric Object Criteria
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectCriteria" (
    "RubricId" bigint,
    "CriterionId" bigint,
    "Name" varchar(500),
    "SortOrder" integer,
    "CriteriaGroupId" bigint,
    "GroupName" varchar(256),
    "GroupSortOrder" integer,
    "LevelSetId" bigint,
    "IsDeleted" boolean
);
