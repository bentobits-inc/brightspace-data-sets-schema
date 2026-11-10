-- Quiz Survey Sections
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[QuizSurveySections];
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
