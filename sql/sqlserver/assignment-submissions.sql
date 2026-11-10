-- Assignment Submissions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[AssignmentSubmissions]', N'U') IS NULL
CREATE TABLE [dbo].[AssignmentSubmissions] (
    [DropboxId] bigint NULL,
    [OrgUnitId] int NULL,
    [SubmitterId] bigint NULL,
    [SubmitterType] varchar(5) NULL,
    [FileSubmissionCount] int NULL,
    [TotalFileSize] bigint NULL,
    [FeedbackUserId] int NULL,
    [FeedbackIsRead] bit NULL,
    [Score] decimal(19,9) NULL,
    [IsGraded] bit NULL,
    [LastSubmissionDate] datetime2 NULL,
    [Feedback] nvarchar(1000) NULL,
    [FeedbackLastModified] datetime2 NULL,
    [FeedbackReadDate] datetime2 NULL,
    [CompletionDate] datetime2 NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
