-- Grade Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeResults` (
    `GradeObjectId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `PointsNumerator` NUMERIC(19,9),
    `PointsDenominator` NUMERIC(19,9),
    `WeightedNumerator` NUMERIC(19,9),
    `WeightedDenominator` NUMERIC(19,9),
    `IsReleased` BOOL,
    `IsDropped` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Comments` STRING(1000),
    `PrivateComments` STRING(1000),
    `GradeText` STRING(50),
    `GradeReleasedDate` DATETIME,
    `Version` INT64,
    `IsDeleted` BOOL
);
