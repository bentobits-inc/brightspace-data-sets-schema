-- Assignment Summary
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(128),
    "Category" VARCHAR(128),
    "Type" VARCHAR(10),
    "GradeItemId" BIGINT,
    "PossibleScore" NUMBER(19,9),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "IsRestricted" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "TurnItInEnabled" BOOLEAN,
    "IsHidden" BOOLEAN,
    "SortOrder" INT,
    "SubmissionType" VARCHAR(18),
    "CompletionType" VARCHAR(27),
    "ResultId" INT,
    "CategoryId" BIGINT,
    "Version" BIGINT,
    "StartDateAvailabilityType" SMALLINT,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INT,
    "Instructions" VARCHAR(10000)
);
