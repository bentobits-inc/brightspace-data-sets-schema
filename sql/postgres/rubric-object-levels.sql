-- Rubric Object Levels
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectLevels" (
    "RubricId" bigint,
    "LevelId" bigint,
    "Name" varchar(256),
    "Description" varchar(1000),
    "Feedback" varchar(1000),
    "Value" numeric(19,9),
    "RangeStartValue" numeric(19,9),
    "SortOrder" integer,
    "LevelSetId" bigint,
    "IsDeleted" boolean
);
