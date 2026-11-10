-- Question Answers
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[QuestionAnswers]', N'U') IS NULL
CREATE TABLE [dbo].[QuestionAnswers] (
    [AnswerId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [SortOrder] int NULL,
    [Weight] decimal(19,9) NULL,
    [Answer] nvarchar(1000) NULL,
    [Comment] nvarchar(1000) NULL,
    [Description] nvarchar(256) NULL
);
