-- Assignment Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSubmissions" (
    "DropboxId" bigint,
    "OrgUnitId" integer,
    "SubmitterId" bigint,
    "SubmitterType" varchar(5),
    "FileSubmissionCount" integer,
    "TotalFileSize" bigint,
    "FeedbackUserId" integer,
    "FeedbackIsRead" boolean,
    "Score" numeric(19,9),
    "IsGraded" boolean,
    "LastSubmissionDate" timestamp,
    "Feedback" varchar(1000),
    "FeedbackLastModified" timestamp,
    "FeedbackReadDate" timestamp,
    "CompletionDate" timestamp,
    "IsDeleted" boolean,
    "Version" bigint
);
