-- Survey Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SurveyObjects" (
    "SurveyId" BIGINT,
    "SurveyName" VARCHAR(1000),
    "CategoryId" BIGINT,
    "OrgUnitId" INT,
    "Description" VARCHAR(1000),
    "DescriptionEnabled" BOOLEAN,
    "HasInstantFeedback" BOOLEAN,
    "IsAnonymous" BOOLEAN,
    "IsVisible" BOOLEAN,
    "SubmissionMessage" VARCHAR(1000),
    "Footer" VARCHAR(1000),
    "FooterIsDisplayed" BOOLEAN,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DisplayInCalendar" BOOLEAN,
    "ResultId" BIGINT,
    "AttemptsAllowed" INT,
    "SortOrder" INT,
    "CreatedBy" INT,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "Version" BIGINT,
    "CategoryName" VARCHAR(256)
);
