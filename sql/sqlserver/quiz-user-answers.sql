-- Quiz User Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
IF OBJECT_ID(N'[dbo].[QuizUserAnswers]', N'U') IS NULL
CREATE TABLE [dbo].[QuizUserAnswers] (
    [AttemptId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [TimeCompleted] datetime2 NULL,
    [QuestionNumber] int NULL,
    [Comment] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [Score] decimal(19,9) NULL,
    [Page] int NULL,
    [SectionId] bigint NULL,
    [ObjectId] bigint NULL,
    [OutOf] decimal(19,9) NULL,
    [TimeStarted] datetime2 NULL,
    [IsBonus] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [QuizTimeCompleted] datetime2 NULL
);
