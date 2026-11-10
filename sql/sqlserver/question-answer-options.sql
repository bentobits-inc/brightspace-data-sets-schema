-- Question Answer Options
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionAnswerOptions];
CREATE TABLE [dbo].[QuestionAnswerOptions] (
    [AnswerId] bigint NULL,
    [AnswerText] nvarchar(1000) NULL,
    [Weight] decimal(19,9) NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [AnswerOptionId] int NULL
);
