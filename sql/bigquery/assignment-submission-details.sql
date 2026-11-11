-- Assignment Submission Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AssignmentSubmissionDetails` (
    `SubmissionId` INT64,
    `DropboxId` INT64,
    `UserId` INT64,
    `GroupId` INT64,
    `NumberOfFilesSubmitted` INT64,
    `TotalFileSize` INT64,
    `SubmittedByUserId` INT64,
    `DateSubmitted` DATETIME,
    `Comments` STRING(1000),
    `IsTurnItInExempt` BOOL,
    `IsDeleted` BOOL,
    `IsPreview` BOOL,
    `Version` INT64
);
