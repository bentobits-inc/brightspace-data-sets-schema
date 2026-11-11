-- Discussion Forums
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionForums` (
    `OrgUnitId` INT64,
    `ForumId` INT64,
    `Name` STRING(400),
    `Description` STRING(1000),
    `MustPostToParticipate` BOOL,
    `AllowAnon` BOOL,
    `IsHidden` BOOL,
    `RequiresApproval` BOOL,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `ResultId` INT64,
    `StartDate` DATETIME,
    `StartDateAvailabilityType` INT64,
    `EndDate` DATETIME,
    `EndDateAvailabilityType` INT64,
    `Version` INT64
);
