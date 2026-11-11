-- Question Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswers" (
    "AnswerId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "SortOrder" INTEGER,
    "Weight" DECIMAL(19,9),
    "Answer" VARCHAR,
    "Comment" VARCHAR,
    "Description" VARCHAR
);
