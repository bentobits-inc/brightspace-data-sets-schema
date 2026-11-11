-- Rubric Criteria Levels
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `RubricCriteriaLevels` (
    `RubricId` INT64,
    `CriterionId` INT64,
    `Description` STRING(1000),
    `Feedback` STRING(1000),
    `Value` NUMERIC(19,9),
    `LevelId` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);
