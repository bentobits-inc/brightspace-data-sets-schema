-- Quiz Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[QuizObjects];
CREATE TABLE [dbo].[QuizObjects] (
    [QuizId] bigint NULL,
    [QuizName] nvarchar(256) NULL,
    [QuizDescription] nvarchar(1000) NULL,
    [QuizCategory] nvarchar(256) NULL,
    [IsActive] bit NULL,
    [OrgUnitId] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [GradeObjectId] bigint NULL,
    [OverallScoreCalculation] varchar(23) NULL,
    [QuizScoreDenominator] decimal(19,9) NULL,
    [HasPassword] bit NULL,
    [IPRestricted] bit NULL,
    [TimeLimit] int NULL,
    [TimeLimitEnforced] bit NULL,
    [AttemptsAllowed] int NULL,
    [PreventMovingBackwards] bit NULL,
    [AllowHints] bit NULL,
    [NotificationEmail] nvarchar(1000) NULL,
    [DisablePagerAccess] bit NULL,
    [DisplayInCalendar] bit NULL,
    [IsAttemptRldb] bit NULL,
    [IsSubviewRldb] bit NULL,
    [SortOrder] int NULL,
    [CategoryId] bigint NULL,
    [ResultId] bigint NULL,
    [IsRetakeIncorrectOnly] bit NULL,
    [PagingTypeId] int NULL,
    [IsSynchronous] bit NULL,
    [DeductionPercentage] int NULL,
    [AIStudySupport] bit NULL,
    [HideQuestionPoints] bit NULL,
    [IsSingleSession] bit NULL,
    [HideAnnotationTools] bit NULL
);
