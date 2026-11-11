-- TurnItIn Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS "TurnItInSubmissions" (
    "DropboxId" BIGINT,
    "SubmissionId" BIGINT,
    "FileId" BIGINT,
    "LastSubmissionDate" TIMESTAMP,
    "SubmissionStatus" SMALLINT,
    "SubmissionErrorType" SMALLINT,
    "ErrorMessage" VARCHAR,
    "SubmittedBy" INTEGER,
    "LastRefreshDate" TIMESTAMP,
    "LastModified" TIMESTAMP
);
