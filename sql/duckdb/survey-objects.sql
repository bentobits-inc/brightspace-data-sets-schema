-- Survey Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SurveyObjects" (
    "SurveyId" BIGINT,
    "SurveyName" VARCHAR,
    "CategoryId" BIGINT,
    "OrgUnitId" INTEGER,
    "Description" VARCHAR,
    "DescriptionEnabled" BOOLEAN,
    "HasInstantFeedback" BOOLEAN,
    "IsAnonymous" BOOLEAN,
    "IsVisible" BOOLEAN,
    "SubmissionMessage" VARCHAR,
    "Footer" VARCHAR,
    "FooterIsDisplayed" BOOLEAN,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DisplayInCalendar" BOOLEAN,
    "ResultId" BIGINT,
    "AttemptsAllowed" INTEGER,
    "SortOrder" INTEGER,
    "CreatedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "Version" BIGINT,
    "CategoryName" VARCHAR
);
