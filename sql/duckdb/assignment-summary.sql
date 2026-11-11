-- Assignment Summary
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" BIGINT,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "Category" VARCHAR,
    "Type" VARCHAR,
    "GradeItemId" BIGINT,
    "PossibleScore" DECIMAL(19,9),
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "IsRestricted" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "TurnItInEnabled" BOOLEAN,
    "IsHidden" BOOLEAN,
    "SortOrder" INTEGER,
    "SubmissionType" VARCHAR,
    "CompletionType" VARCHAR,
    "ResultId" INTEGER,
    "CategoryId" BIGINT,
    "Version" BIGINT,
    "StartDateAvailabilityType" SMALLINT,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INTEGER,
    "Instructions" VARCHAR
);
