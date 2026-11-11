-- Grade Objects Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeObjectsLog` (
    `LogId` INT64,
    `Name` STRING(50),
    `GradeObjectId` INT64,
    `UserId` INT64,
    `GradeSymbolString` STRING(50),
    `PointsDenominator` NUMERIC(19,9),
    `PointsNumerator` NUMERIC(19,9),
    `WeightedDenominator` NUMERIC(19,9),
    `WeightedNumerator` NUMERIC(19,9),
    `Modified` DATETIME,
    `ModifiedBy` INT64
);
