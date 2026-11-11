-- Competency Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS `CompetencyLog` (
    `CompetencyLogId` BIGINT,
    `LogTypeId` INT,
    `LogTypeName` STRING,
    `ObjectId` BIGINT,
    `ObjectTypeId` INT,
    `ObjectTypeName` STRING,
    `ObjectVersion` INT,
    `LogDateTime` TIMESTAMP_NTZ,
    `ModifiedBy` BIGINT,
    `IndirectObjectId` BIGINT,
    `IndirectObjectTypeName` STRING,
    `IndirectObjectTypeId` INT,
    `IndirectObjectVersion` INT
);
