-- Question Library
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionLibrary];
CREATE TABLE [dbo].[QuestionLibrary] (
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [IsAutoGraded] bit NULL,
    [TemplateTypeId] int NULL,
    [QuestionType] varchar(28) NULL,
    [Name] nvarchar(256) NULL,
    [Question] nvarchar(1000) NULL,
    [Comment] nvarchar(1000) NULL,
    [AnswerKey] nvarchar(1000) NULL,
    [CreationDate] datetime2 NULL,
    [Version] bigint NULL,
    [AllowsAttachments] bit NULL,
    [AIUtilization] int NULL
);
