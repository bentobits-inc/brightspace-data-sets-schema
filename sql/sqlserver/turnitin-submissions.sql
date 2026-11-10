-- TurnItIn Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
IF OBJECT_ID(N'[dbo].[TurnItInSubmissions]', N'U') IS NULL
CREATE TABLE [dbo].[TurnItInSubmissions] (
    [DropboxId] bigint NULL,
    [SubmissionId] bigint NULL,
    [FileId] bigint NULL,
    [LastSubmissionDate] datetime2 NULL,
    [SubmissionStatus] smallint NULL,
    [SubmissionErrorType] smallint NULL,
    [ErrorMessage] nvarchar(255) NULL,
    [SubmittedBy] int NULL,
    [LastRefreshDate] datetime2 NULL,
    [LastModified] datetime2 NULL
);
