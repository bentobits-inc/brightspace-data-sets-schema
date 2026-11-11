-- Quiz Survey Sections
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizSurveySections` (
    `CollectionId` INT64,
    `SectionId` INT64,
    `Name` STRING(256),
    `NameIsDisplayed` BOOL,
    `IsQuestionPool` BOOL,
    `SectionText` STRING(1000),
    `SectionTextIsHTML` BOOL,
    `IsSectionTextHidden` BOOL,
    `QuestionPoints` NUMERIC(19,9),
    `NumQuestions` INT64,
    `NumChoices` INT64,
    `Shuffle` BOOL,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);
