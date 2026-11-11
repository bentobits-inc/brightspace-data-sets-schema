-- Survey Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SurveyObjects" (
    "SurveyId" bigint,
    "SurveyName" varchar(1000),
    "CategoryId" bigint,
    "OrgUnitId" integer,
    "Description" varchar(1000),
    "DescriptionEnabled" boolean,
    "HasInstantFeedback" boolean,
    "IsAnonymous" boolean,
    "IsVisible" boolean,
    "SubmissionMessage" varchar(1000),
    "Footer" varchar(1000),
    "FooterIsDisplayed" boolean,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DisplayInCalendar" boolean,
    "ResultId" bigint,
    "AttemptsAllowed" integer,
    "SortOrder" integer,
    "CreatedBy" integer,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "Version" bigint,
    "CategoryName" varchar(256)
);
