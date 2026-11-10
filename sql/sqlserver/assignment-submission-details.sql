-- Assignment Submission Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[AssignmentSubmissionDetails]', N'U') IS NULL
CREATE TABLE [dbo].[AssignmentSubmissionDetails] (
    [SubmissionId] bigint NULL,
    [DropboxId] bigint NULL,
    [UserId] bigint NULL,
    [GroupId] bigint NULL,
    [NumberOfFilesSubmitted] int NULL,
    [TotalFileSize] bigint NULL,
    [SubmittedByUserId] int NULL,
    [DateSubmitted] datetime2 NULL,
    [Comments] nvarchar(1000) NULL,
    [IsTurnItInExempt] bit NULL,
    [IsDeleted] bit NULL,
    [IsPreview] bit NULL,
    [Version] bigint NULL
);
