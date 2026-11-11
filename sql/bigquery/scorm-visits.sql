-- SCORM Visits
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SCORMVisits` (
    `VisitId` STRING(36),
    `ScormObjectId` STRING(36),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `FirstAccessDate` DATETIME,
    `LastAccessDate` DATETIME,
    `CompletedDate` DATETIME,
    `Completion` STRING(100),
    `Success` STRING(100),
    `Score` FLOAT64,
    `TimeSpent` INT64,
    `Progress` FLOAT64,
    `LastModified` DATETIME
);
