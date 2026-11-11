-- Outcomes Aligned to Tool Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesAlignedToToolObjects` (
    `ObjectType` INT64,
    `ObjectId` STRING(255),
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `AIUtilization` INT64
);
