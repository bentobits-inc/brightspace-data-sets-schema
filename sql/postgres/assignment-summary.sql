-- Assignment Summary
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(128),
    "Category" varchar(128),
    "Type" varchar(10),
    "GradeItemId" bigint,
    "PossibleScore" numeric(19,9),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "IsRestricted" boolean,
    "IsDeleted" boolean,
    "TurnItInEnabled" boolean,
    "IsHidden" boolean,
    "SortOrder" integer,
    "SubmissionType" varchar(18),
    "CompletionType" varchar(27),
    "ResultId" integer,
    "CategoryId" bigint,
    "Version" bigint,
    "StartDateAvailabilityType" smallint,
    "EndDateAvailabilityType" smallint,
    "AIUtilization" integer,
    "Instructions" varchar(10000)
);
