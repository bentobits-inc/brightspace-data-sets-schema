-- Quiz Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttempts" (
    "AttemptId" BIGINT,
    "QuizId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "AttemptNumber" INT,
    "TimeStarted" TIMESTAMP_NTZ,
    "TimeCompleted" TIMESTAMP_NTZ,
    "Score" NUMBER(19,9),
    "IsGraded" BOOLEAN,
    "OldAttemptNumber" INT,
    "IsDeleted" BOOLEAN,
    "PossibleScore" NUMBER(19,9),
    "IsRetakeIncorrectOnly" BOOLEAN,
    "DueDate" TIMESTAMP_NTZ,
    "TimeLimit" INT,
    "TimeLimitEnforced" BOOLEAN,
    "TimeLimitExceededBehaviour" VARCHAR(128),
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INT,
    "Version" BIGINT
);
