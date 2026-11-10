-- Assignment Summary
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[AssignmentSummary]', N'U') IS NULL
CREATE TABLE [dbo].[AssignmentSummary] (
    [DropboxId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(128) NULL,
    [Category] nvarchar(128) NULL,
    [Type] varchar(10) NULL,
    [GradeItemId] bigint NULL,
    [PossibleScore] decimal(19,9) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [IsRestricted] bit NULL,
    [IsDeleted] bit NULL,
    [TurnItInEnabled] bit NULL,
    [IsHidden] bit NULL,
    [SortOrder] int NULL,
    [SubmissionType] varchar(18) NULL,
    [CompletionType] varchar(27) NULL,
    [ResultId] int NULL,
    [CategoryId] bigint NULL,
    [Version] bigint NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDateAvailabilityType] smallint NULL,
    [AIUtilization] int NULL,
    [Instructions] nvarchar(max) NULL
);
