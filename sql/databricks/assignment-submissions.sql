-- Assignment Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AssignmentSubmissions` (
    `DropboxId` BIGINT,
    `OrgUnitId` INT,
    `SubmitterId` BIGINT,
    `SubmitterType` STRING,
    `FileSubmissionCount` INT,
    `TotalFileSize` BIGINT,
    `FeedbackUserId` INT,
    `FeedbackIsRead` BOOLEAN,
    `Score` DECIMAL(19,9),
    `IsGraded` BOOLEAN,
    `LastSubmissionDate` TIMESTAMP_NTZ,
    `Feedback` STRING,
    `FeedbackLastModified` TIMESTAMP_NTZ,
    `FeedbackReadDate` TIMESTAMP_NTZ,
    `CompletionDate` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);
