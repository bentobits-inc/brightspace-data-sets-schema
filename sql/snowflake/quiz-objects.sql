-- Quiz Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "QuizObjects" (
    "QuizId" BIGINT,
    "QuizName" VARCHAR(256),
    "QuizDescription" VARCHAR(1000),
    "QuizCategory" VARCHAR(256),
    "IsActive" BOOLEAN,
    "OrgUnitId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "CreationDate" TIMESTAMP_NTZ,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" BIGINT,
    "GradeObjectId" BIGINT,
    "OverallScoreCalculation" VARCHAR(23),
    "QuizScoreDenominator" NUMBER(19,9),
    "HasPassword" BOOLEAN,
    "IPRestricted" BOOLEAN,
    "TimeLimit" INT,
    "TimeLimitEnforced" BOOLEAN,
    "AttemptsAllowed" INT,
    "PreventMovingBackwards" BOOLEAN,
    "AllowHints" BOOLEAN,
    "NotificationEmail" VARCHAR(1000),
    "DisablePagerAccess" BOOLEAN,
    "DisplayInCalendar" BOOLEAN,
    "IsAttemptRldb" BOOLEAN,
    "IsSubviewRldb" BOOLEAN,
    "SortOrder" INT,
    "CategoryId" BIGINT,
    "ResultId" BIGINT,
    "IsRetakeIncorrectOnly" BOOLEAN,
    "PagingTypeId" INT,
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INT,
    "AIStudySupport" BOOLEAN,
    "HideQuestionPoints" BOOLEAN,
    "IsSingleSession" BOOLEAN,
    "HideAnnotationTools" BOOLEAN
);
