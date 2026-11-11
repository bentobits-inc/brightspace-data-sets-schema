-- Quiz Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `QuizObjects` (
    `QuizId` INT64,
    `QuizName` STRING(256),
    `QuizDescription` STRING(1000),
    `QuizCategory` STRING(256),
    `IsActive` BOOL,
    `OrgUnitId` INT64,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `GradeObjectId` INT64,
    `OverallScoreCalculation` STRING(23),
    `QuizScoreDenominator` NUMERIC(19,9),
    `HasPassword` BOOL,
    `IPRestricted` BOOL,
    `TimeLimit` INT64,
    `TimeLimitEnforced` BOOL,
    `AttemptsAllowed` INT64,
    `PreventMovingBackwards` BOOL,
    `AllowHints` BOOL,
    `NotificationEmail` STRING(1000),
    `DisablePagerAccess` BOOL,
    `DisplayInCalendar` BOOL,
    `IsAttemptRldb` BOOL,
    `IsSubviewRldb` BOOL,
    `SortOrder` INT64,
    `CategoryId` INT64,
    `ResultId` INT64,
    `IsRetakeIncorrectOnly` BOOL,
    `PagingTypeId` INT64,
    `IsSynchronous` BOOL,
    `DeductionPercentage` INT64,
    `AIStudySupport` BOOL,
    `HideQuestionPoints` BOOL,
    `IsSingleSession` BOOL,
    `HideAnnotationTools` BOOL
);
