-- Creator+ Practices Adoption
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CreatorPracticesAdoption` (
    `ActivityInstanceId` INT64,
    `CreatedById` INT64,
    `OrgUnitId` INT64,
    `PracticeType` STRING(32),
    `PracticeTitle` STRING(255),
    `ProviderObjectId` INT64,
    `CreatedDate` DATETIME,
    `Version` INT64
);
