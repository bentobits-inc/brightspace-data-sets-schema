-- Rubric Criteria Levels
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "RubricCriteriaLevels" (
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "Description" VARCHAR(1000),
    "Feedback" VARCHAR(1000),
    "Value" NUMBER(19,9),
    "LevelId" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);
