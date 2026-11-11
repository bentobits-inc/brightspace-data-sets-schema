-- TurnItIn Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS `TurnItInSubmissions` (
    `DropboxId` INT64,
    `SubmissionId` INT64,
    `FileId` INT64,
    `LastSubmissionDate` DATETIME,
    `SubmissionStatus` INT64,
    `SubmissionErrorType` INT64,
    `ErrorMessage` STRING(255),
    `SubmittedBy` INT64,
    `LastRefreshDate` DATETIME,
    `LastModified` DATETIME
);
