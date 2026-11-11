-- Assignment Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AssignmentSubmissions` (
    `DropboxId` INT64,
    `OrgUnitId` INT64,
    `SubmitterId` INT64,
    `SubmitterType` STRING(5),
    `FileSubmissionCount` INT64,
    `TotalFileSize` INT64,
    `FeedbackUserId` INT64,
    `FeedbackIsRead` BOOL,
    `Score` NUMERIC(19,9),
    `IsGraded` BOOL,
    `LastSubmissionDate` DATETIME,
    `Feedback` STRING(1000),
    `FeedbackLastModified` DATETIME,
    `FeedbackReadDate` DATETIME,
    `CompletionDate` DATETIME,
    `IsDeleted` BOOL,
    `Version` INT64
);
