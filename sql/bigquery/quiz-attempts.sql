-- Quiz Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttempts` (
    `AttemptId` INT64,
    `QuizId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `AttemptNumber` INT64,
    `TimeStarted` DATETIME,
    `TimeCompleted` DATETIME,
    `Score` NUMERIC(19,9),
    `IsGraded` BOOL,
    `OldAttemptNumber` INT64,
    `IsDeleted` BOOL,
    `PossibleScore` NUMERIC(19,9),
    `IsRetakeIncorrectOnly` BOOL,
    `DueDate` DATETIME,
    `TimeLimit` INT64,
    `TimeLimitEnforced` BOOL,
    `TimeLimitExceededBehaviour` STRING(128),
    `IsSynchronous` BOOL,
    `DeductionPercentage` INT64,
    `Version` INT64
);
