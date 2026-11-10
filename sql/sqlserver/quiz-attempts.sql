-- Quiz Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[QuizAttempts]', N'U') IS NULL
CREATE TABLE [dbo].[QuizAttempts] (
    [AttemptId] bigint NULL,
    [QuizId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [AttemptNumber] int NULL,
    [TimeStarted] datetime2 NULL,
    [TimeCompleted] datetime2 NULL,
    [Score] decimal(19,9) NULL,
    [IsGraded] bit NULL,
    [OldAttemptNumber] int NULL,
    [IsDeleted] bit NULL,
    [PossibleScore] decimal(19,9) NULL,
    [IsRetakeIncorrectOnly] bit NULL,
    [DueDate] datetime2 NULL,
    [TimeLimit] int NULL,
    [TimeLimitEnforced] bit NULL,
    [TimeLimitExceededBehaviour] nvarchar(128) NULL,
    [IsSynchronous] bit NULL,
    [DeductionPercentage] int NULL,
    [Version] bigint NULL
);
