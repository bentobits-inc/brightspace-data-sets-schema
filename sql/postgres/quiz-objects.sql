-- Quiz Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "QuizObjects" (
    "QuizId" bigint,
    "QuizName" varchar(256),
    "QuizDescription" varchar(1000),
    "QuizCategory" varchar(256),
    "IsActive" boolean,
    "OrgUnitId" integer,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "GradeObjectId" bigint,
    "OverallScoreCalculation" varchar(23),
    "QuizScoreDenominator" numeric(19,9),
    "HasPassword" boolean,
    "IPRestricted" boolean,
    "TimeLimit" integer,
    "TimeLimitEnforced" boolean,
    "AttemptsAllowed" integer,
    "PreventMovingBackwards" boolean,
    "AllowHints" boolean,
    "NotificationEmail" varchar(1000),
    "DisablePagerAccess" boolean,
    "DisplayInCalendar" boolean,
    "IsAttemptRldb" boolean,
    "IsSubviewRldb" boolean,
    "SortOrder" integer,
    "CategoryId" bigint,
    "ResultId" bigint,
    "IsRetakeIncorrectOnly" boolean,
    "PagingTypeId" integer,
    "IsSynchronous" boolean,
    "DeductionPercentage" integer,
    "AIStudySupport" boolean,
    "HideQuestionPoints" boolean,
    "IsSingleSession" boolean,
    "HideAnnotationTools" boolean
);
