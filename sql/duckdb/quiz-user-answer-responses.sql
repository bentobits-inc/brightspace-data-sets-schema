-- Quiz User Answer Responses
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "QuizUserAnswerResponses" (
    "AttemptId" BIGINT,
    "AttemptNumber" INTEGER,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerId" BIGINT,
    "SortOrder" INTEGER,
    "IsCorrect" BOOLEAN,
    "UserSelection" BIGINT,
    "UserAnswer" VARCHAR,
    "FileSetId" BIGINT,
    "LastModified" TIMESTAMP,
    "IsDeleted" BOOLEAN
);
