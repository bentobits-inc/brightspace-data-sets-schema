-- Discussion Topics
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionTopics` (
    `OrgUnitId` INT64,
    `TopicId` INT64,
    `ForumId` INT64,
    `Name` STRING(1000),
    `Description` STRING(1000),
    `MustPostToParticipate` BOOL,
    `AllowAnon` BOOL,
    `IsHidden` BOOL,
    `RequiresApproval` BOOL,
    `LastPostDate` DATETIME,
    `LastPostUserId` INT64,
    `NumViews` INT64,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `GradeItemId` INT64,
    `ScoreOutOf` FLOAT64,
    `ScoreCalculationMethod` STRING(19),
    `IncludeNonScoredValues` BOOL,
    `Version` INT64,
    `ResultId` INT64,
    `StartDate` DATETIME,
    `StartDateAvailabilityType` INT64,
    `EndDate` DATETIME,
    `EndDateAvailabilityType` INT64,
    `AIUtilization` INT64,
    `DueDate` DATETIME
);
