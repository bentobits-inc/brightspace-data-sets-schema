-- Assignment Submission Details
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AssignmentSubmissionDetails];
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
