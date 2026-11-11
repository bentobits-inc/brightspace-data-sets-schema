-- CPD Question Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDQuestionAnswers" (
    "AnswerId" INTEGER,
    "AnswerText" VARCHAR,
    "QuestionId" INTEGER,
    "RecordId" INTEGER,
    "UserId" INTEGER,
    "Action" VARCHAR,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);
