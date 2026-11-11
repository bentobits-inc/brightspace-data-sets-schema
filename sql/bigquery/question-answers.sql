-- Question Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionAnswers` (
    `AnswerId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `SortOrder` INT64,
    `Weight` NUMERIC(19,9),
    `Answer` STRING(1000),
    `Comment` STRING(1000),
    `Description` STRING(256)
);
