-- Question Library
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionLibrary` (
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `IsAutoGraded` BOOLEAN,
    `TemplateTypeId` INT,
    `QuestionType` STRING,
    `Name` STRING,
    `Question` STRING,
    `Comment` STRING,
    `AnswerKey` STRING,
    `CreationDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `AllowsAttachments` BOOLEAN,
    `AIUtilization` INT
);
