-- Question Relationships
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionRelationships` (
    `CollectionId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `Order` INT64,
    `SectionId` INT64,
    `IsQuestionPool` BOOL,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Points` NUMERIC(19,9),
    `Difficulty` INT64,
    `IsBonus` BOOL,
    `IsMandatory` BOOL,
    `IsDeleted` BOOL,
    `Version` INT64,
    `ObjectId` INT64
);
