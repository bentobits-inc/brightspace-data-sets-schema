-- Quiz User Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS "QuizUserAnswers" (
    "AttemptId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "TimeCompleted" TIMESTAMP,
    "QuestionNumber" INTEGER,
    "Comment" VARCHAR,
    "SortOrder" INTEGER,
    "Score" DECIMAL(19,9),
    "Page" INTEGER,
    "SectionId" BIGINT,
    "ObjectId" BIGINT,
    "OutOf" DECIMAL(19,9),
    "TimeStarted" TIMESTAMP,
    "IsBonus" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "QuizTimeCompleted" TIMESTAMP
);
