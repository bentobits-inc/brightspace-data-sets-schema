-- Question Relationships
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[QuestionRelationships]', N'U') IS NULL
CREATE TABLE [dbo].[QuestionRelationships] (
    [CollectionId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [Order] bigint NULL,
    [SectionId] bigint NULL,
    [IsQuestionPool] bit NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [Points] decimal(19,9) NULL,
    [Difficulty] int NULL,
    [IsBonus] bit NULL,
    [IsMandatory] bit NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL,
    [ObjectId] bigint NULL
);
