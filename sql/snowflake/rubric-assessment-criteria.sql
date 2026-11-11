-- Rubric Assessment Criteria
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricAssessmentCriteria" (
    "AssessmentId" BIGINT,
    "RubricId" BIGINT,
    "Score" NUMBER(19,9),
    "Feedback" VARCHAR(4000),
    "IsScoreOverridden" BOOLEAN,
    "CriterionId" BIGINT,
    "LevelAchievedId" BIGINT,
    "Version" BIGINT
);
