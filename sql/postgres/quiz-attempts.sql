-- Quiz Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttempts" (
    "AttemptId" bigint,
    "QuizId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "AttemptNumber" integer,
    "TimeStarted" timestamp,
    "TimeCompleted" timestamp,
    "Score" numeric(19,9),
    "IsGraded" boolean,
    "OldAttemptNumber" integer,
    "IsDeleted" boolean,
    "PossibleScore" numeric(19,9),
    "IsRetakeIncorrectOnly" boolean,
    "DueDate" timestamp,
    "TimeLimit" integer,
    "TimeLimitEnforced" boolean,
    "TimeLimitExceededBehaviour" varchar(128),
    "IsSynchronous" boolean,
    "DeductionPercentage" integer,
    "Version" bigint
);
