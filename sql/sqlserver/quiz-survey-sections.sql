-- Quiz Survey Sections
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[QuizSurveySections]', N'U') IS NULL
CREATE TABLE [dbo].[QuizSurveySections] (
    [CollectionId] bigint NULL,
    [SectionId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [NameIsDisplayed] bit NULL,
    [IsQuestionPool] bit NULL,
    [SectionText] nvarchar(1000) NULL,
    [SectionTextIsHTML] bit NULL,
    [IsSectionTextHidden] bit NULL,
    [QuestionPoints] decimal(19,9) NULL,
    [NumQuestions] int NULL,
    [NumChoices] int NULL,
    [Shuffle] bit NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
