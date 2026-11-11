-- Survey Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SurveyObjects` (
    `SurveyId` INT64,
    `SurveyName` STRING(1000),
    `CategoryId` INT64,
    `OrgUnitId` INT64,
    `Description` STRING(1000),
    `DescriptionEnabled` BOOL,
    `HasInstantFeedback` BOOL,
    `IsAnonymous` BOOL,
    `IsVisible` BOOL,
    `SubmissionMessage` STRING(1000),
    `Footer` STRING(1000),
    `FooterIsDisplayed` BOOL,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DisplayInCalendar` BOOL,
    `ResultId` INT64,
    `AttemptsAllowed` INT64,
    `SortOrder` INT64,
    `CreatedBy` INT64,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Version` INT64,
    `CategoryName` STRING(256)
);
