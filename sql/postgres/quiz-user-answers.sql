-- Quiz User Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS "QuizUserAnswers" (
    "AttemptId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "TimeCompleted" timestamp,
    "QuestionNumber" integer,
    "Comment" varchar(1000),
    "SortOrder" integer,
    "Score" numeric(19,9),
    "Page" integer,
    "SectionId" bigint,
    "ObjectId" bigint,
    "OutOf" numeric(19,9),
    "TimeStarted" timestamp,
    "IsBonus" boolean,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "QuizTimeCompleted" timestamp
);
