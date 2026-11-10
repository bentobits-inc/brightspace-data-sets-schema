-- Survey User Answer Responses
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
DROP TABLE IF EXISTS [dbo].[SurveyUserAnswerResponses];
CREATE TABLE [dbo].[SurveyUserAnswerResponses] (
    [AttemptId] bigint NULL,
    [AttemptNumber] int NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [AnswerId] bigint NULL,
    [SortOrder] bigint NULL,
    [IsCorrect] bit NULL,
    [UserSelection] bigint NULL,
    [UserAnswer] nvarchar(1000) NULL,
    [FileSetId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL
);
