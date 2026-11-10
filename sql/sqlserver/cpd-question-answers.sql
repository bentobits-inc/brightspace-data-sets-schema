-- CPD Question Answers
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDQuestionAnswers];
CREATE TABLE [dbo].[CPDQuestionAnswers] (
    [AnswerId] int NULL,
    [AnswerText] nvarchar(4000) NULL,
    [QuestionId] int NULL,
    [RecordId] int NULL,
    [UserId] int NULL,
    [Action] nvarchar(16) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);
