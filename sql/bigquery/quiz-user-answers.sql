-- Quiz User Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS `QuizUserAnswers` (
    `AttemptId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `TimeCompleted` DATETIME,
    `QuestionNumber` INT64,
    `Comment` STRING(1000),
    `SortOrder` INT64,
    `Score` NUMERIC(19,9),
    `Page` INT64,
    `SectionId` INT64,
    `ObjectId` INT64,
    `OutOf` NUMERIC(19,9),
    `TimeStarted` DATETIME,
    `IsBonus` BOOL,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `QuizTimeCompleted` DATETIME
);
