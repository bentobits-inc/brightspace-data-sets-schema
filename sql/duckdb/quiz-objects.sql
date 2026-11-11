-- Quiz Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "QuizObjects" (
    "QuizId" BIGINT,
    "QuizName" VARCHAR,
    "QuizDescription" VARCHAR,
    "QuizCategory" VARCHAR,
    "IsActive" BOOLEAN,
    "OrgUnitId" INTEGER,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "CreationDate" TIMESTAMP,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" BIGINT,
    "GradeObjectId" BIGINT,
    "OverallScoreCalculation" VARCHAR,
    "QuizScoreDenominator" DECIMAL(19,9),
    "HasPassword" BOOLEAN,
    "IPRestricted" BOOLEAN,
    "TimeLimit" INTEGER,
    "TimeLimitEnforced" BOOLEAN,
    "AttemptsAllowed" INTEGER,
    "PreventMovingBackwards" BOOLEAN,
    "AllowHints" BOOLEAN,
    "NotificationEmail" VARCHAR,
    "DisablePagerAccess" BOOLEAN,
    "DisplayInCalendar" BOOLEAN,
    "IsAttemptRldb" BOOLEAN,
    "IsSubviewRldb" BOOLEAN,
    "SortOrder" INTEGER,
    "CategoryId" BIGINT,
    "ResultId" BIGINT,
    "IsRetakeIncorrectOnly" BOOLEAN,
    "PagingTypeId" INTEGER,
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INTEGER,
    "AIStudySupport" BOOLEAN,
    "HideQuestionPoints" BOOLEAN,
    "IsSingleSession" BOOLEAN,
    "HideAnnotationTools" BOOLEAN
);
