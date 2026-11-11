-- Quiz User Answer Responses
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS `QuizUserAnswerResponses` (
    `AttemptId` INT64,
    `AttemptNumber` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `AnswerId` INT64,
    `SortOrder` INT64,
    `IsCorrect` BOOL,
    `UserSelection` INT64,
    `UserAnswer` STRING(1000),
    `FileSetId` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL
);
