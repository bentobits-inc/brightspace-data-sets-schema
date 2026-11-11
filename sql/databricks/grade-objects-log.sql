-- Grade Objects Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeObjectsLog` (
    `LogId` BIGINT,
    `Name` STRING,
    `GradeObjectId` INT,
    `UserId` INT,
    `GradeSymbolString` STRING,
    `PointsDenominator` DECIMAL(19,9),
    `PointsNumerator` DECIMAL(19,9),
    `WeightedDenominator` DECIMAL(19,9),
    `WeightedNumerator` DECIMAL(19,9),
    `Modified` TIMESTAMP_NTZ,
    `ModifiedBy` INT
);
