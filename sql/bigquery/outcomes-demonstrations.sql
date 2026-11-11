-- Outcomes Demonstrations
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesDemonstrations` (
    `DemonstrationId` STRING(36),
    `ExplicitlyEnteredScaleLevelId` STRING(36),
    `AutomaticallyGeneratedScaleLevelId` STRING(36),
    `AlignedObjectType` INT64,
    `AlignedObjectId` STRING(1000),
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `IsPublished` BOOL,
    `AssessedUserId` INT64,
    `AssessedDate` DATETIME,
    `AssessorUserId` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);
