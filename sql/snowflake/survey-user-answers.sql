-- Survey User Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswers" (
    "AttemptId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "TimeCompleted" TIMESTAMP_NTZ,
    "QuestionNumber" INT,
    "Comment" VARCHAR(1000),
    "SortOrder" INT,
    "Score" NUMBER(19,9),
    "Page" INT,
    "Assigned" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "SurveyTimeCompleted" TIMESTAMP_NTZ
);
