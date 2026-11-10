-- Survey User Answers
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SurveyUserAnswers];
CREATE TABLE [dbo].[SurveyUserAnswers] (
    [AttemptId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [TimeCompleted] datetime2 NULL,
    [QuestionNumber] int NULL,
    [Comment] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [Score] decimal(19,9) NULL,
    [Page] int NULL,
    [Assigned] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [SurveyTimeCompleted] datetime2 NULL
);
