-- All 144 Brightspace Data Sets tables for SQL Server 2016 or later. Safe to run again.
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Accommodations Profile Log
-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AccommodationsProfileLog];
CREATE TABLE [dbo].[AccommodationsProfileLog] (
    [AccommodatedUserId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [QuizTimeLimitMultiplier] decimal(5,2) NULL,
    [QuizTimeLimitExtraTime] int NULL,
    [QuizControlAlwaysAllowRightClick] bit NULL,
    [ModifiedBy] bigint NULL,
    [LastModified] datetime2 NULL
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ActivityExemptionsLog];
CREATE TABLE [dbo].[ActivityExemptionsLog] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [ObjectId] int NULL,
    [ActivityId] varchar(225) NULL,
    [LogTypeName] varchar(50) NULL,
    [LastModifiedUtc] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [ActivityExemptionsLogId] bigint NULL,
    [ToolId] int NULL
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ActivityFeedCommentLog];
CREATE TABLE [dbo].[ActivityFeedCommentLog] (
    [LogId] uniqueidentifier NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [CommentId] uniqueidentifier NULL,
    [Action] nvarchar(16) NULL,
    [ActionDate] datetime2 NULL,
    [Content] nvarchar(3072) NULL,
    [PostId] uniqueidentifier NULL
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
DROP TABLE IF EXISTS [dbo].[ActivityFeedCommentObjects];
CREATE TABLE [dbo].[ActivityFeedCommentObjects] (
    [OrgUnitId] int NULL,
    [CommentId] uniqueidentifier NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [Content] nvarchar(3072) NULL,
    [IsDeleted] bit NULL,
    [PostId] uniqueidentifier NULL,
    [Version] bigint NULL
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ActivityFeedPostLog];
CREATE TABLE [dbo].[ActivityFeedPostLog] (
    [LogId] uniqueidentifier NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [PostId] uniqueidentifier NULL,
    [PostType] nvarchar(16) NULL,
    [Action] nvarchar(16) NULL,
    [ActionDate] datetime2 NULL,
    [DropboxId] bigint NULL,
    [Content] nvarchar(3072) NULL,
    [CommentCount] int NULL,
    [AttachmentCount] int NULL
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ActivityFeedPostObjects];
CREATE TABLE [dbo].[ActivityFeedPostObjects] (
    [OrgUnitId] int NULL,
    [PostId] uniqueidentifier NULL,
    [PostType] nvarchar(16) NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [DropboxId] bigint NULL,
    [Content] nvarchar(3072) NULL,
    [IsDeleted] bit NULL,
    [CommentCount] int NULL,
    [AttachmentCount] int NULL,
    [Version] bigint NULL
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AIConsumption];
CREATE TABLE [dbo].[AIConsumption] (
    [ConsumptionId] nvarchar(255) NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [Date] datetime2 NULL,
    [GenerationCount] int NULL,
    [ConsumptionSource] int NULL
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[Announcements];
CREATE TABLE [dbo].[Announcements] (
    [AnnouncementId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [Title] nvarchar(400) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsGlobal] bit NULL,
    [IsDraft] bit NULL,
    [NumAttachments] int NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [CreatedBy] int NULL,
    [IsAuthorInfoShown] bit NULL,
    [CreatedDate] datetime2 NULL,
    [ResultId] bigint NULL
);

-- Assignment Special Access
-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AssignmentSpecialAccess];
CREATE TABLE [dbo].[AssignmentSpecialAccess] (
    [DropboxId] bigint NULL,
    [UserId] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [ModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDateAvailabilityType] smallint NULL
);

-- Assignment Submission Details
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

-- Assignment Submissions
-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AssignmentSubmissions];
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

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AssignmentSummary];
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

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AttendanceRegisters];
CREATE TABLE [dbo].[AttendanceRegisters] (
    [AttendanceRegisterId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(128) NULL,
    [Description] nvarchar(1000) NULL,
    [SchemeId] bigint NULL,
    [IsVisible] bit NULL,
    [IncludeAllUsers] bit NULL,
    [CauseForConcern] decimal(19,9) NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AttendanceSchemes];
CREATE TABLE [dbo].[AttendanceSchemes] (
    [SchemeId] bigint NULL,
    [OrgUnitId] int NULL,
    [SchemeName] nvarchar(128) NULL,
    [SchemeSymbolId] bigint NULL,
    [SymbolName] nvarchar(128) NULL,
    [SymbolValue] nvarchar(50) NULL,
    [Percentage] decimal(19,9) NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
DROP TABLE IF EXISTS [dbo].[AttendanceSessions];
CREATE TABLE [dbo].[AttendanceSessions] (
    [AttendanceSessionId] bigint NULL,
    [AttendanceRegisterId] bigint NULL,
    [Name] nvarchar(128) NULL,
    [Description] nvarchar(256) NULL,
    [SortOrder] int NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
DROP TABLE IF EXISTS [dbo].[AttendanceUserSessions];
CREATE TABLE [dbo].[AttendanceUserSessions] (
    [UserId] int NULL,
    [AttendanceSessionId] bigint NULL,
    [SchemeSymbolId] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
DROP TABLE IF EXISTS [dbo].[AudioVideoProcessed];
CREATE TABLE [dbo].[AudioVideoProcessed] (
    [ContentId] uniqueidentifier NULL,
    [RevisionId] uniqueidentifier NULL,
    [RevisionNumber] int NULL,
    [Type] nvarchar(5) NULL,
    [Source] nvarchar(32) NULL,
    [RevisionSize] bigint NULL,
    [Duration] int NULL,
    [RequiredTranscoding] bit NULL,
    [RequiredTranscribing] bit NULL,
    [LastModified] datetime2 NULL
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AuditorRelationshipsLog];
CREATE TABLE [dbo].[AuditorRelationshipsLog] (
    [AuditorId] int NULL,
    [UserToAuditId] int NULL,
    [OrgUnitId] int NULL,
    [Action] nvarchar(16) NULL,
    [ModifiedBy] int NULL,
    [ModifiedDate] datetime2 NULL
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[AwardObjects];
CREATE TABLE [dbo].[AwardObjects] (
    [AwardId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [AwardTypeId] int NULL,
    [Type] nvarchar(128) NULL,
    [Description] nvarchar(512) NULL,
    [ExpiryCalculationType] nvarchar(128) NULL,
    [ExpiryNotificationType] nvarchar(128) NULL,
    [ExpiryDate] datetime2 NULL,
    [ImagePath] varchar(1000) NULL,
    [CreatedByUserId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [Criteria] nvarchar(1000) NULL
);

-- Awards Issued
-- Primary key (informational, not enforced): IssuedId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): IssuedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RevokedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AwardsIssued];
CREATE TABLE [dbo].[AwardsIssued] (
    [AwardId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [UserId] bigint NULL,
    [IssuedBy] int NULL,
    [IssueDate] datetime2 NULL,
    [ExpiryDate] datetime2 NULL,
    [IssuedId] bigint NULL,
    [Criteria] nvarchar(1000) NULL,
    [Evidence] nvarchar(1000) NULL,
    [RevokedDate] datetime2 NULL,
    [RevokedReason] nvarchar(1000) NULL,
    [RevokedBy] bigint NULL,
    [LastModifiedBy] bigint NULL,
    [LastModifiedDate] datetime2 NULL,
    [Version] bigint NULL,
    [CertificateId] nvarchar(12) NULL
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[BrightspaceEmailLog];
CREATE TABLE [dbo].[BrightspaceEmailLog] (
    [MailId] int NULL,
    [SenderUserId] int NULL,
    [SenderAddress] nvarchar(256) NULL,
    [RecipientAddress] nvarchar(256) NULL,
    [RecipientType] nvarchar(4) NULL,
    [DateTimeSent] datetime2 NULL,
    [Subject] nvarchar(1000) NULL
);

-- Calendar Events
-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CalendarEvents];
CREATE TABLE [dbo].[CalendarEvents] (
    [ScheduleId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [UserId] bigint NULL,
    [Title] nvarchar(256) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [TimeZoneIdentifier] varchar(256) NULL,
    [IsAllDayEvent] bit NULL,
    [RecurrenceType] varchar(7) NULL,
    [RecurrenceInterval] int NULL,
    [CreatedByUserId] int NULL,
    [LastModified] datetime2 NULL,
    [EventObjectTypeName] nvarchar(200) NULL,
    [ObjectLookupId1] bigint NULL,
    [ObjectLookupId2] bigint NULL
);

-- Checklist Category Details
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ChecklistCategoryDetails];
CREATE TABLE [dbo].[ChecklistCategoryDetails] (
    [CategoryId] bigint NULL,
    [ChecklistId] bigint NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [SortOrder] int NULL,
    [LastModifiedUtc] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ChecklistCompletions];
CREATE TABLE [dbo].[ChecklistCompletions] (
    [UserId] int NULL,
    [DateCompleted] datetime2 NULL,
    [ItemId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsCompleted] bit NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);

-- Checklist Item Details
-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ChecklistItemDetails];
CREATE TABLE [dbo].[ChecklistItemDetails] (
    [ItemId] bigint NULL,
    [CategoryId] bigint NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [DueDate] datetime2 NULL,
    [ScheduleId] int NULL,
    [SortOrder] int NULL,
    [IsAutoChecked] bit NULL,
    [LastModifiedUtc] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ChecklistObjects];
CREATE TABLE [dbo].[ChecklistObjects] (
    [ChecklistId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(512) NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionIsHtml] bit NULL,
    [SharedUserId] int NULL,
    [DisplayInNewWindow] bit NULL,
    [SortOrder] int NULL,
    [Version] bigint NULL,
    [ResultId] int NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[CompetencyActivities];
CREATE TABLE [dbo].[CompetencyActivities] (
    [ActivityId] bigint NULL,
    [OrgUnitId] int NULL,
    [ActivityName] nvarchar(256) NULL,
    [ActivityTypeId] int NULL,
    [AssessmentType] varchar(7) NULL,
    [ObjectLookupId] bigint NULL,
    [RubricId] bigint NULL,
    [LevelId] bigint NULL,
    [RubricCriterionId] bigint NULL,
    [AssessmentThresholdCriteria] varchar(2) NULL,
    [AssessmentThreshold] decimal(19,9) NULL,
    [IsAutoEval] bit NULL,
    [RubricName] nvarchar(256) NULL,
    [RubricLevelRequired] nvarchar(256) NULL,
    [ObjectId] bigint NULL,
    [ActivityType] nvarchar(50) NULL,
    [Version] bigint NULL
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CompetencyActivityLog];
CREATE TABLE [dbo].[CompetencyActivityLog] (
    [ActivityId] bigint NULL,
    [ActivityLogId] bigint NULL,
    [LogTypeId] int NULL,
    [LogTypeName] varchar(19) NULL,
    [LogDateTime] datetime2 NULL,
    [ModifiedBy] bigint NULL
);

-- Competency Activity Results
-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CompetencyActivityResults];
CREATE TABLE [dbo].[CompetencyActivityResults] (
    [ActivityId] bigint NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [LearningObjectId] bigint NULL,
    [IsAchieved] bit NULL,
    [PercentAchieved] decimal(19,9) NULL,
    [RubricScore] decimal(19,9) NULL,
    [RubricLevelAchieved] nvarchar(256) NULL,
    [RubricId] bigint NULL,
    [RubricCriterionId] bigint NULL,
    [AchievedDate] datetime2 NULL,
    [Version] bigint NULL
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
DROP TABLE IF EXISTS [dbo].[CompetencyLog];
CREATE TABLE [dbo].[CompetencyLog] (
    [CompetencyLogId] bigint NULL,
    [LogTypeId] int NULL,
    [LogTypeName] varchar(19) NULL,
    [ObjectId] bigint NULL,
    [ObjectTypeId] int NULL,
    [ObjectTypeName] varchar(18) NULL,
    [ObjectVersion] int NULL,
    [LogDateTime] datetime2 NULL,
    [ModifiedBy] bigint NULL,
    [IndirectObjectId] bigint NULL,
    [IndirectObjectTypeName] varchar(18) NULL,
    [IndirectObjectTypeId] int NULL,
    [IndirectObjectVersion] int NULL
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[CompetencyObjects];
CREATE TABLE [dbo].[CompetencyObjects] (
    [ObjectId] bigint NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(256) NULL,
    [Type] varchar(256) NULL,
    [ReadyForEvaluation] bit NULL,
    [Status] varchar(9) NULL,
    [Description] nvarchar(1000) NULL,
    [NeedReevaluation] bit NULL,
    [ReevaluationIfAchieved] bit NULL,
    [ReevaluationIfNotAchieved] bit NULL,
    [AdditionalIdentifier] nvarchar(512) NULL,
    [IsHidden] bit NULL
);

-- Competency Structure
-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
DROP TABLE IF EXISTS [dbo].[CompetencyStructure];
CREATE TABLE [dbo].[CompetencyStructure] (
    [ObjectId] bigint NULL,
    [ParentObjectId] bigint NULL,
    [BaseObjectID] bigint NULL,
    [Depth] int NULL,
    [EntryTime] int NULL
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ContentFilesPropertiesLog];
CREATE TABLE [dbo].[ContentFilesPropertiesLog] (
    [OrgUnitId] int NULL,
    [ContentObjectId] int NULL,
    [Action] nvarchar(10) NULL,
    [FilePath] nvarchar(max) NULL,
    [FileName] nvarchar(512) NULL,
    [FileExtension] nvarchar(512) NULL,
    [FileSizeBytes] bigint NULL,
    [UploadDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
DROP TABLE IF EXISTS [dbo].[ContentObjects];
CREATE TABLE [dbo].[ContentObjects] (
    [ContentObjectId] int NULL,
    [OrgUnitId] int NULL,
    [Title] nvarchar(150) NULL,
    [ContentObjectType] varchar(6) NULL,
    [CompletionType] varchar(7) NULL,
    [ParentContentObjectId] int NULL,
    [Location] nvarchar(1024) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [ObjectId1] int NULL,
    [ObjectId2] int NULL,
    [ObjectId3] int NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [SortOrder] int NULL,
    [Depth] int NULL,
    [ToolId] int NULL,
    [IsHidden] bit NULL,
    [ResultId] int NULL,
    [DeletedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedBy] int NULL,
    [DeletedBy] int NULL,
    [AIUtilization] int NULL,
    [Version] bigint NULL
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ContentUserCompletion];
CREATE TABLE [dbo].[ContentUserCompletion] (
    [ContentObjectId] int NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [DateCompleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AutomaticDateCompleted] datetime2 NULL,
    [ManualDateCompleted] datetime2 NULL
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ContentUserProgress];
CREATE TABLE [dbo].[ContentUserProgress] (
    [ContentObjectId] int NULL,
    [UserId] int NULL,
    [CompletedDate] datetime2 NULL,
    [LastVisited] datetime2 NULL,
    [IsRead] bit NULL,
    [NumRealVisits] int NULL,
    [NumFakeVisits] int NULL,
    [TotalTime] bigint NULL,
    [IsVisited] bit NULL,
    [IsCurrentBookmark] bit NULL,
    [IsSelfAssessComplete] bit NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CourseAccess];
CREATE TABLE [dbo].[CourseAccess] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [DayAccessed] datetime2 NULL
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CourseAccessLog];
CREATE TABLE [dbo].[CourseAccessLog] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [Timestamp] datetime2 NULL,
    [Source] nvarchar(20) NULL
);

-- Course Awards
-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[CourseAwards];
CREATE TABLE [dbo].[CourseAwards] (
    [AssociationId] bigint NULL,
    [AwardId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [DateCreated] datetime2 NULL,
    [HiddenAward] bit NULL,
    [ConditionSetId] bigint NULL,
    [LastModified] datetime2 NULL,
    [Credits] decimal(9,2) NULL,
    [IsAssociated] bit NULL,
    [Version] bigint NULL
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CourseCopyLogs];
CREATE TABLE [dbo].[CourseCopyLogs] (
    [SourceOrgUnitId] int NULL,
    [DestinationOrgUnitId] int NULL,
    [UserId] bigint NULL,
    [Status] varchar(128) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsDestinationNew] bit NULL,
    [CopyProtectedResources] bit NULL,
    [CopyCourseJobId] bigint NULL,
    [StatusId] int NULL
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CoursePublisherLaunches];
CREATE TABLE [dbo].[CoursePublisherLaunches] (
    [LaunchId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [RecipientId] uniqueidentifier NULL,
    [UserId] int NULL,
    [RoleId] int NULL,
    [LaunchMethod] nvarchar(256) NULL,
    [ExternalUserId] nvarchar(256) NULL,
    [ExternalLMSType] nvarchar(256) NULL,
    [IsNewUser] bit NULL,
    [LastModified] datetime2 NULL
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[CoursePublisherRecipients];
CREATE TABLE [dbo].[CoursePublisherRecipients] (
    [RecipientID] uniqueidentifier NULL,
    [Name] nvarchar(256) NULL,
    [CreatedAt] datetime2 NULL,
    [LastModified] datetime2 NULL
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[CPDCategories];
CREATE TABLE [dbo].[CPDCategories] (
    [CategoryId] int NULL,
    [Name] nvarchar(256) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
DROP TABLE IF EXISTS [dbo].[CPDJobTargets];
CREATE TABLE [dbo].[CPDJobTargets] (
    [PrincipalId] int NULL,
    [CategoryId] int NULL,
    [JobTitle] nvarchar(256) NULL,
    [StructuredMinutes] int NULL,
    [UnstructuredMinutes] int NULL,
    [StructuredRecordCount] int NULL,
    [UnstructuredRecordCount] int NULL,
    [StartDate] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[CPDMethods];
CREATE TABLE [dbo].[CPDMethods] (
    [MethodId] int NULL,
    [Name] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDQuestionAnswers];
CREATE TABLE [dbo].[CPDQuestionAnswers] (
    [AnswerId] int NULL,
    [AnswerText] nvarchar(4000) NULL,
    [QuestionId] int NULL,
    [RecordId] int NULL,
    [UserId] int NULL,
    [Action] nvarchar(16) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[CPDQuestions];
CREATE TABLE [dbo].[CPDQuestions] (
    [QuestionId] int NULL,
    [QuestionText] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDUserRecords];
CREATE TABLE [dbo].[CPDUserRecords] (
    [RecordId] int NULL,
    [RecordName] nvarchar(256) NULL,
    [State] nvarchar(50) NULL,
    [UserId] int NULL,
    [Category] int NULL,
    [Method] int NULL,
    [CreditMinutes] int NULL,
    [Evidence] nvarchar(4000) NULL,
    [Type] nvarchar(50) NULL,
    [Grade] decimal(4,3) NULL,
    [DateCompleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDUserTargets];
CREATE TABLE [dbo].[CPDUserTargets] (
    [PrincipalId] int NULL,
    [CategoryId] int NULL,
    [UserId] int NULL,
    [StructuredMinutes] int NULL,
    [UnstructuredMinutes] int NULL,
    [StructuredRecordCount] int NULL,
    [UnstructuredRecordCount] int NULL,
    [StartDate] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[CreatorPracticesAdoption];
CREATE TABLE [dbo].[CreatorPracticesAdoption] (
    [ActivityInstanceId] int NULL,
    [CreatedById] int NULL,
    [OrgUnitId] int NULL,
    [PracticeType] nvarchar(32) NULL,
    [PracticeTitle] nvarchar(255) NULL,
    [ProviderObjectId] int NULL,
    [CreatedDate] datetime2 NULL,
    [Version] bigint NULL
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CreatorPracticesEngagement];
CREATE TABLE [dbo].[CreatorPracticesEngagement] (
    [PracticeEngagementId] int NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [CompletionStatus] nvarchar(10) NULL,
    [ActivityInstanceId] int NULL,
    [CompletionDate] datetime2 NULL,
    [Version] bigint NULL
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[DiscussionForums];
CREATE TABLE [dbo].[DiscussionForums] (
    [OrgUnitId] int NULL,
    [ForumId] bigint NULL,
    [Name] nvarchar(400) NULL,
    [Description] nvarchar(1000) NULL,
    [MustPostToParticipate] bit NULL,
    [AllowAnon] bit NULL,
    [IsHidden] bit NULL,
    [RequiresApproval] bit NULL,
    [SortOrder] int NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [ResultId] int NULL,
    [StartDate] datetime2 NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDate] datetime2 NULL,
    [EndDateAvailabilityType] smallint NULL,
    [Version] bigint NULL
);

-- Discussion Posts
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[DiscussionPosts];
CREATE TABLE [dbo].[DiscussionPosts] (
    [OrgUnitId] int NULL,
    [TopicId] bigint NULL,
    [UserId] int NULL,
    [PostId] bigint NULL,
    [ThreadId] bigint NULL,
    [IsReply] bit NULL,
    [ParentPostId] bigint NULL,
    [NumReplies] int NULL,
    [DatePosted] datetime2 NULL,
    [IsDeleted] bit NULL,
    [RatingSum] bigint NULL,
    [NumRatings] bigint NULL,
    [Score] decimal(19,9) NULL,
    [LastEditDate] datetime2 NULL,
    [SortOrder] int NULL,
    [Depth] int NULL,
    [Thread] nvarchar(400) NULL,
    [WordCount] int NULL,
    [AttachmentCount] int NULL,
    [Version] bigint NULL
);

-- Discussion Posts Read Status
-- Primary key (informational, not enforced): UserId, PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): PostId -> DiscussionPosts.PostId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[DiscussionPostsReadStatus];
CREATE TABLE [dbo].[DiscussionPostsReadStatus] (
    [TopicId] bigint NULL,
    [UserId] int NULL,
    [PostId] bigint NULL,
    [IsRead] bit NULL,
    [FirstReadDate] datetime2 NULL,
    [LastReadDate] datetime2 NULL,
    [Version] bigint NULL
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[DiscussionTopicUserScores];
CREATE TABLE [dbo].[DiscussionTopicUserScores] (
    [UserId] int NULL,
    [TopicId] bigint NULL,
    [Score] decimal(19,9) NULL,
    [IsGraded] bit NULL,
    [Version] bigint NULL,
    [IsDeleted] bit NULL
);

-- Discussion Topics
-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[DiscussionTopics];
CREATE TABLE [dbo].[DiscussionTopics] (
    [OrgUnitId] int NULL,
    [TopicId] bigint NULL,
    [ForumId] bigint NULL,
    [Name] nvarchar(1000) NULL,
    [Description] nvarchar(1000) NULL,
    [MustPostToParticipate] bit NULL,
    [AllowAnon] bit NULL,
    [IsHidden] bit NULL,
    [RequiresApproval] bit NULL,
    [LastPostDate] datetime2 NULL,
    [LastPostUserId] bigint NULL,
    [NumViews] bigint NULL,
    [SortOrder] int NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [GradeItemId] int NULL,
    [ScoreOutOf] float(53) NULL,
    [ScoreCalculationMethod] varchar(19) NULL,
    [IncludeNonScoredValues] bit NULL,
    [Version] bigint NULL,
    [ResultId] int NULL,
    [StartDate] datetime2 NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDate] datetime2 NULL,
    [EndDateAvailabilityType] smallint NULL,
    [AIUtilization] int NULL,
    [DueDate] datetime2 NULL
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[EnrollmentsAndWithdrawals];
CREATE TABLE [dbo].[EnrollmentsAndWithdrawals] (
    [LogId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [RoleId] int NULL,
    [Action] varchar(50) NULL,
    [ModifiedByUserId] int NULL,
    [EnrollmentDate] datetime2 NULL
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[GradeBookSettings];
CREATE TABLE [dbo].[GradeBookSettings] (
    [OrgUnitId] int NULL,
    [GradeSchemeId] bigint NULL,
    [GradingSystem] varchar(8) NULL,
    [UngradedItems] varchar(25) NULL,
    [IsAdjustedFinalGradeReleased] bit NULL,
    [IsCalculatedFinalGradeReleased] bit NULL,
    [LastModified] datetime2 NULL
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[GradeObjects];
CREATE TABLE [dbo].[GradeObjects] (
    [GradeObjectId] int NULL,
    [OrgUnitId] int NULL,
    [ParentGradeObjectId] int NULL,
    [Name] nvarchar(128) NULL,
    [TypeName] varchar(50) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsAutoPointed] bit NULL,
    [IsFormula] bit NULL,
    [IsBonus] bit NULL,
    [MaxPoints] decimal(19,9) NULL,
    [CanExceedMaxGrade] bit NULL,
    [ExcludeFromFinalGradeCalc] bit NULL,
    [GradeSchemeId] bigint NULL,
    [Weight] decimal(19,9) NULL,
    [NumLowestGradesToDrop] int NULL,
    [NumHighestGradesToDrop] int NULL,
    [WeightDistributionType] varchar(8) NULL,
    [CreatedDate] datetime2 NULL,
    [ToolName] nvarchar(50) NULL,
    [AssociatedToolItemId] bigint NULL,
    [LastModified] datetime2 NULL,
    [ShortName] nvarchar(128) NULL,
    [GradeObjectTypeId] int NULL,
    [SortOrder] int NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [ResultId] int NULL,
    [ToolId] int NULL,
    [Version] int NULL
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[GradeObjectsLog];
CREATE TABLE [dbo].[GradeObjectsLog] (
    [LogId] bigint NULL,
    [Name] nvarchar(50) NULL,
    [GradeObjectId] int NULL,
    [UserId] int NULL,
    [GradeSymbolString] nvarchar(50) NULL,
    [PointsDenominator] decimal(19,9) NULL,
    [PointsNumerator] decimal(19,9) NULL,
    [WeightedDenominator] decimal(19,9) NULL,
    [WeightedNumerator] decimal(19,9) NULL,
    [Modified] datetime2 NULL,
    [ModifiedBy] int NULL
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[GradeResults];
CREATE TABLE [dbo].[GradeResults] (
    [GradeObjectId] int NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [PointsNumerator] decimal(19,9) NULL,
    [PointsDenominator] decimal(19,9) NULL,
    [WeightedNumerator] decimal(19,9) NULL,
    [WeightedDenominator] decimal(19,9) NULL,
    [IsReleased] bit NULL,
    [IsDropped] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [Comments] nvarchar(1000) NULL,
    [PrivateComments] nvarchar(1000) NULL,
    [GradeText] nvarchar(50) NULL,
    [GradeReleasedDate] datetime2 NULL,
    [Version] bigint NULL,
    [IsDeleted] bit NULL
);

-- Grade Scheme Ranges
-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
DROP TABLE IF EXISTS [dbo].[GradeSchemeRanges];
CREATE TABLE [dbo].[GradeSchemeRanges] (
    [GradeSchemeRangeId] bigint NULL,
    [GradeSchemeId] bigint NULL,
    [SymbolString] nvarchar(100) NULL,
    [AssignedValue] decimal(19,9) NULL,
    [RangeStart] decimal(19,9) NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[GradeSchemes];
CREATE TABLE [dbo].[GradeSchemes] (
    [GradeSchemeId] bigint NULL,
    [OrgUnitId] int NULL,
    [SchemeName] nvarchar(128) NULL,
    [DeletedDate] datetime2 NULL,
    [Version] bigint NULL
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[IntelligentAgentObjects];
CREATE TABLE [dbo].[IntelligentAgentObjects] (
    [AgentId] bigint NULL,
    [OrgUnitId] int NULL,
    [AgentName] nvarchar(128) NULL,
    [Description] nvarchar(1000) NULL,
    [Enabled] bit NULL,
    [SpecificRoles] nvarchar(1000) NULL,
    [LoginConditionEnabled] bit NULL,
    [LoginConditionThreshold] int NULL,
    [LoginConditionType] nvarchar(14) NULL,
    [AccessConditionEnabled] bit NULL,
    [AccessConditionThreshold] int NULL,
    [AccessConditionType] nvarchar(20) NULL,
    [ResultId] bigint NULL,
    [RepeatType] nvarchar(10) NULL,
    [EmailWhenSatisfied] bit NULL,
    [EnableSchedule] bit NULL,
    [ScheduleType] nvarchar(10) NULL,
    [ScheduleRepeatsEvery] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Intelligent Agent Run Log
-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
DROP TABLE IF EXISTS [dbo].[IntelligentAgentRunLog];
CREATE TABLE [dbo].[IntelligentAgentRunLog] (
    [AgentId] bigint NULL,
    [AgentRunId] bigint NULL,
    [IsPracticeRun] bit NULL,
    [IsRunNow] bit NULL,
    [NumUsers] int NULL,
    [NumUsersWithErrors] int NULL,
    [NumUsersWithInfos] int NULL,
    [NumUsersWithWarnings] int NULL,
    [RunUserId] int NULL,
    [RunDate] datetime2 NULL
);

-- Intelligent Agent Run Users
-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[IntelligentAgentRunUsers];
CREATE TABLE [dbo].[IntelligentAgentRunUsers] (
    [AgentId] bigint NULL,
    [AgentRunId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [ActionTypeName] nvarchar(50) NULL,
    [ActionHasError] bit NULL,
    [ActionHasInfo] bit NULL,
    [ActionHasWarning] bit NULL,
    [ShouldRetry] bit NULL
);

-- JIT Provisioned Users Log
-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[JITProvisionedUsersLog];
CREATE TABLE [dbo].[JITProvisionedUsersLog] (
    [UserId] int NULL,
    [MappingField] nvarchar(32) NULL,
    [MappingFieldValue] nvarchar(270) NULL,
    [ProviderType] nvarchar(32) NULL,
    [ProviderId] nvarchar(1024) NULL,
    [RoleId] int NULL,
    [Timestamp] datetime2 NULL,
    [Action] nvarchar(16) NULL
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[LocalAuthenticationSecurityLog];
CREATE TABLE [dbo].[LocalAuthenticationSecurityLog] (
    [UserId] int NULL,
    [Action] nvarchar(70) NULL,
    [ModifiedBy] int NULL,
    [ModifiedDate] datetime2 NULL
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[LTIAdvantageDeploymentAudit];
CREATE TABLE [dbo].[LTIAdvantageDeploymentAudit] (
    [Action] nvarchar(10) NULL,
    [DeploymentID] nvarchar(36) NULL,
    [ClientID] nvarchar(36) NULL,
    [DeploymentName] nvarchar(200) NULL,
    [IsDeploymentEnabled] bit NULL,
    [HasAssignmentsAndGrades] bit NULL,
    [HasDeepLinking] bit NULL,
    [HasNamesAndRoles] bit NULL,
    [HasSubmissionReview] bit NULL,
    [HasActivityItemProfile] bit NULL,
    [HasPlatformNotificationService] bit NULL,
    [HasContextCopy] bit NULL,
    [ModifiedBy] bigint NULL,
    [Anonymous] bit NULL,
    [PreProvisioningEnabled] bit NULL,
    [SendOrgUnitInfo] bit NULL,
    [SendUserFirstName] bit NULL,
    [SendUserMiddleName] bit NULL,
    [SendUserLastName] bit NULL,
    [SendUserEmail] bit NULL,
    [SendBrightspaceUserID] bit NULL,
    [SendBrightspaceUsername] bit NULL,
    [SendBrightspaceOrgDefinedId] bit NULL,
    [SendLinkTitle] bit NULL,
    [SendLinkDescription] bit NULL,
    [OpenAsExternal] bit NULL,
    [AutoMigrateLinks] bit NULL,
    [IsSharedToManyOrgUnits] bit NULL,
    [AutoCreateGrades] bit NULL,
    [IncludeInFinalGrade] bit NULL,
    [Timestamp] datetime2 NULL,
    [HasAssetProcessor] bit NULL
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[LTIAdvantageRegistrationAudit];
CREATE TABLE [dbo].[LTIAdvantageRegistrationAudit] (
    [Action] nvarchar(10) NULL,
    [ClientId] nvarchar(255) NULL,
    [ToolName] nvarchar(200) NULL,
    [Domain] nvarchar(2083) NULL,
    [RedirectURLs] nvarchar(2083) NULL,
    [KeysetURL] nvarchar(255) NULL,
    [LoginURL] nvarchar(255) NULL,
    [LTIVersion] varchar(12) NULL,
    [IsRegistrationEnabled] bit NULL,
    [SendInstitutionRole] bit NULL,
    [TargetLinkURI] nvarchar(255) NULL,
    [ModifiedBy] bigint NULL,
    [HasAssignmentAndGradeServices] bit NULL,
    [HasSubmissionReview] bit NULL,
    [HasDeepLinking] bit NULL,
    [HasNamesAndRoleProvisioningServices] bit NULL,
    [HasActivityItemProfile] bit NULL,
    [HasPlatformNotificationService] bit NULL,
    [Timestamp] datetime2 NULL,
    [HasAssetProcessor] bit NULL
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[LTILaunches];
CREATE TABLE [dbo].[LTILaunches] (
    [LTILaunchId] uniqueidentifier NULL,
    [UserId] int NULL,
    [IMSRoleNames] nvarchar(max) NULL,
    [ImpersonatingUserId] bigint NULL,
    [ImpersonatingUserIMSRoleNames] nvarchar(max) NULL,
    [LaunchDate] datetime2 NULL,
    [OrgUnitId] bigint NULL,
    [LTILinkId] bigint NULL,
    [DeploymentId] uniqueidentifier NULL,
    [ClientId] uniqueidentifier NULL,
    [ToolProviderId] nvarchar(300) NULL,
    [ContentTopicId] bigint NULL,
    [ParentModuleId] bigint NULL,
    [Placement] nvarchar(10) NULL,
    [MessageVersion] nvarchar(10) NULL,
    [RequestType] nvarchar(30) NULL
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[LTILinkMigrationAudit];
CREATE TABLE [dbo].[LTILinkMigrationAudit] (
    [LTIMigrationId] uniqueidentifier NULL,
    [UserId] bigint NULL,
    [MigrationDate] datetime2 NULL,
    [OrgUnitId] bigint NULL,
    [LinkId] bigint NULL,
    [LinkURL] nvarchar(2000) NULL,
    [LinkName] nvarchar(200) NULL,
    [ClientId] nvarchar(255) NULL,
    [RegistrationDomain] nvarchar(2083) NULL,
    [DeploymentId] uniqueidentifier NULL,
    [JobId] bigint NULL,
    [Status] smallint NULL,
    [FailureCode] smallint NULL,
    [MigrationType] smallint NULL,
    [LegacyURL] nvarchar(2083) NULL
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[LTILinks];
CREATE TABLE [dbo].[LTILinks] (
    [LtiLinkId] bigint NULL,
    [OrgUnitId] int NULL,
    [Title] nvarchar(200) NULL,
    [LinkType] int NULL,
    [LTIVersion] varchar(12) NULL,
    [Url] nvarchar(2000) NULL,
    [Description] nvarchar(1000) NULL,
    [IsVisible] bit NULL,
    [SendTCInfo] bit NULL,
    [SendContextInfo] bit NULL,
    [SendCourseInfo] bit NULL,
    [SendOrgUnitInfo] bit NULL,
    [SendUserId] bit NULL,
    [SendUserName] bit NULL,
    [SendUserEmail] bit NULL,
    [SendLinkTitle] bit NULL,
    [SendLinkDescription] bit NULL,
    [SendD2LUserName] bit NULL,
    [SendD2LOrgDefinedId] bit NULL,
    [SendD2LOrgRoleId] bit NULL,
    [SendBrightspaceUserId] bit NULL,
    [Anonymous] bit NULL,
    [Shared] bit NULL,
    [UseToolProviderSecuritySettings] bit NULL,
    [LastModifiedDate] datetime2 NULL,
    [OuAvailabilitySetId] bigint NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [CreatedDate] datetime2 NULL,
    [DeploymentId] uniqueidentifier NULL,
    [LinkSubType] int NULL
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[MediaConsumptionLog];
CREATE TABLE [dbo].[MediaConsumptionLog] (
    [LogId] uniqueidentifier NULL,
    [UserId] int NULL,
    [ContentId] uniqueidentifier NULL,
    [RevisionId] uniqueidentifier NULL,
    [ContentType] nvarchar(5) NULL,
    [ClientApp] nvarchar(32) NULL,
    [DateConsumed] datetime2 NULL,
    [DurationPercentageWatched] int NULL
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[MediaObjects];
CREATE TABLE [dbo].[MediaObjects] (
    [ContentId] uniqueidentifier NULL,
    [Title] nvarchar(1000) NULL,
    [RevisionCount] int NULL,
    [OwnerId] int NULL,
    [LastModified] datetime2 NULL
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[OrganizationalUnitAncestors];
CREATE TABLE [dbo].[OrganizationalUnitAncestors] (
    [OrgUnitId] int NULL,
    [AncestorOrgUnitId] int NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[OrganizationalUnitDescendants];
CREATE TABLE [dbo].[OrganizationalUnitDescendants] (
    [OrgUnitId] int NULL,
    [DescendantOrgUnitId] int NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[OrganizationalUnitParents];
CREATE TABLE [dbo].[OrganizationalUnitParents] (
    [OrgUnitId] int NULL,
    [ParentOrgUnitId] int NULL,
    [RowVersion] bigint NULL,
    [DateDeleted] datetime2 NULL
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OrganizationalUnitRecentAccess];
CREATE TABLE [dbo].[OrganizationalUnitRecentAccess] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [LastAccessedDate] datetime2 NULL
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[OrganizationalUnits];
CREATE TABLE [dbo].[OrganizationalUnits] (
    [OrgUnitId] int NULL,
    [Organization] nvarchar(50) NULL,
    [Type] nvarchar(50) NULL,
    [Name] nvarchar(128) NULL,
    [Code] nvarchar(50) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsActive] bit NULL,
    [CreatedDate] datetime2 NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [RecycledDate] datetime2 NULL,
    [Version] bigint NULL,
    [OrgUnitTypeId] int NULL
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomeDetails];
CREATE TABLE [dbo].[OutcomeDetails] (
    [OutcomeId] uniqueidentifier NULL,
    [OutcomeDefinitionSource] nvarchar(1000) NULL,
    [OutcomeDefinitionId] nvarchar(128) NULL,
    [ParentOutcomeId] uniqueidentifier NULL,
    [Description] nvarchar(1000) NULL,
    [Notation] nvarchar(1000) NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomesAlignedToToolObjects];
CREATE TABLE [dbo].[OutcomesAlignedToToolObjects] (
    [ObjectType] int NULL,
    [ObjectId] nvarchar(255) NULL,
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AIUtilization] int NULL
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
DROP TABLE IF EXISTS [dbo].[OutcomesAssessedCheckpoints];
CREATE TABLE [dbo].[OutcomesAssessedCheckpoints] (
    [CheckpointId] uniqueidentifier NULL,
    [DemonstrationId] uniqueidentifier NULL,
    [Feedback] nvarchar(1000) NULL,
    [ConfigDecayRate] int NULL,
    [ConfigAggregationMethod] int NULL,
    [ConfigIncludedActivities] int NULL,
    [ConfigMultipleAttemptStrategy] int NULL,
    [ConfigRecentlyAssessedActivityCount] int NULL,
    [ConfigTieBreaker] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [HasMetAchievementThreshold] bit NULL,
    [AchievedLevelId] uniqueidentifier NULL
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesCourseSpecificScales];
CREATE TABLE [dbo].[OutcomesCourseSpecificScales] (
    [OrgUnitId] int NULL,
    [RegistryId] uniqueidentifier NULL,
    [ScaleId] uniqueidentifier NULL,
    [AchievementThreshold] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomesDemonstrations];
CREATE TABLE [dbo].[OutcomesDemonstrations] (
    [DemonstrationId] uniqueidentifier NULL,
    [ExplicitlyEnteredScaleLevelId] uniqueidentifier NULL,
    [AutomaticallyGeneratedScaleLevelId] uniqueidentifier NULL,
    [AlignedObjectType] int NULL,
    [AlignedObjectId] nvarchar(1000) NULL,
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [IsPublished] bit NULL,
    [AssessedUserId] int NULL,
    [AssessedDate] datetime2 NULL,
    [AssessorUserId] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
DROP TABLE IF EXISTS [dbo].[OutcomesInRegistries];
CREATE TABLE [dbo].[OutcomesInRegistries] (
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Outcomes Rubric Alignments
-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
DROP TABLE IF EXISTS [dbo].[OutcomesRubricAlignments];
CREATE TABLE [dbo].[OutcomesRubricAlignments] (
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomesScaleDefinition];
CREATE TABLE [dbo].[OutcomesScaleDefinition] (
    [ScaleId] uniqueidentifier NULL,
    [Name] nvarchar(1000) NULL,
    [IsDefault] bit NULL,
    [UsePercentages] bit NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AchievementThreshold] uniqueidentifier NULL
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesScaleLevelDefinition];
CREATE TABLE [dbo].[OutcomesScaleLevelDefinition] (
    [ScaleLevelId] uniqueidentifier NULL,
    [ScaleId] uniqueidentifier NULL,
    [Name] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [PercentageRangeStart] int NULL,
    [RGB] nvarchar(40) NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesSetCourse];
CREATE TABLE [dbo].[OutcomesSetCourse] (
    [RegistryId] uniqueidentifier NULL,
    [OrgUnitId] bigint NULL,
    [SourceOutcomeSetId] bigint NULL,
    [IsPrimary] bit NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [ScaleId] uniqueidentifier NULL,
    [AchievementThreshold] uniqueidentifier NULL
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesSetOrg];
CREATE TABLE [dbo].[OutcomesSetOrg] (
    [OutcomeSetId] bigint NULL,
    [OutcomeSetName] nvarchar(256) NULL,
    [RegistryId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [ScaleId] uniqueidentifier NULL
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[PortfolioCategories];
CREATE TABLE [dbo].[PortfolioCategories] (
    [CategoryId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(256) NULL,
    [IsRetired] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[PortfolioEvidenceCategories];
CREATE TABLE [dbo].[PortfolioEvidenceCategories] (
    [CategoryId] uniqueidentifier NULL,
    [EvidenceId] uniqueidentifier NULL,
    [Group] nvarchar(30) NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[PortfolioEvidenceLog];
CREATE TABLE [dbo].[PortfolioEvidenceLog] (
    [LogId] uniqueidentifier NULL,
    [ParentObjectId] uniqueidentifier NULL,
    [ObjectId] uniqueidentifier NULL,
    [ObjectType] nvarchar(40) NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [Action] nvarchar(16) NULL,
    [IsMobile] bit NULL,
    [ActionDate] datetime2 NULL
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[PortfolioEvidenceObjects];
CREATE TABLE [dbo].[PortfolioEvidenceObjects] (
    [EvidenceId] uniqueidentifier NULL,
    [OwnerId] int NULL,
    [OrgUnitId] int NULL,
    [EvidenceType] nvarchar(30) NULL,
    [Title] nvarchar(1000) NULL,
    [IsApproved] bit NULL,
    [IsSpotlighted] bit NULL,
    [IsSharedToParents] bit NULL,
    [IsDeleted] bit NULL,
    [IsRecoverableByInstructor] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsSharedWithInstructor] bit NULL,
    [DateSharedWithInstructor] datetime2 NULL
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[PreRequisiteConditionsMet];
CREATE TABLE [dbo].[PreRequisiteConditionsMet] (
    [PreRequisiteId] int NULL,
    [UserId] int NULL,
    [DateMet] datetime2 NULL,
    [Action] nvarchar(7) NULL,
    [LastModified] datetime2 NULL
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionAnswerOptions];
CREATE TABLE [dbo].[QuestionAnswerOptions] (
    [AnswerId] bigint NULL,
    [AnswerText] nvarchar(1000) NULL,
    [Weight] decimal(19,9) NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [AnswerOptionId] int NULL
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionAnswers];
CREATE TABLE [dbo].[QuestionAnswers] (
    [AnswerId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [SortOrder] int NULL,
    [Weight] decimal(19,9) NULL,
    [Answer] nvarchar(1000) NULL,
    [Comment] nvarchar(1000) NULL,
    [Description] nvarchar(256) NULL
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionLibrary];
CREATE TABLE [dbo].[QuestionLibrary] (
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [IsAutoGraded] bit NULL,
    [TemplateTypeId] int NULL,
    [QuestionType] varchar(28) NULL,
    [Name] nvarchar(256) NULL,
    [Question] nvarchar(1000) NULL,
    [Comment] nvarchar(1000) NULL,
    [AnswerKey] nvarchar(1000) NULL,
    [CreationDate] datetime2 NULL,
    [Version] bigint NULL,
    [AllowsAttachments] bit NULL,
    [AIUtilization] int NULL
);

-- Question Pools
-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionPools];
CREATE TABLE [dbo].[QuestionPools] (
    [SectionId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Question Relationships
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionRelationships];
CREATE TABLE [dbo].[QuestionRelationships] (
    [CollectionId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [Order] bigint NULL,
    [SectionId] bigint NULL,
    [IsQuestionPool] bit NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [Points] decimal(19,9) NULL,
    [Difficulty] int NULL,
    [IsBonus] bit NULL,
    [IsMandatory] bit NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL,
    [ObjectId] bigint NULL
);

-- Quiz Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[QuizAttempts];
CREATE TABLE [dbo].[QuizAttempts] (
    [AttemptId] bigint NULL,
    [QuizId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [AttemptNumber] int NULL,
    [TimeStarted] datetime2 NULL,
    [TimeCompleted] datetime2 NULL,
    [Score] decimal(19,9) NULL,
    [IsGraded] bit NULL,
    [OldAttemptNumber] int NULL,
    [IsDeleted] bit NULL,
    [PossibleScore] decimal(19,9) NULL,
    [IsRetakeIncorrectOnly] bit NULL,
    [DueDate] datetime2 NULL,
    [TimeLimit] int NULL,
    [TimeLimitEnforced] bit NULL,
    [TimeLimitExceededBehaviour] nvarchar(128) NULL,
    [IsSynchronous] bit NULL,
    [DeductionPercentage] int NULL,
    [Version] bigint NULL
);

-- Quiz Attempts Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[QuizAttemptsLog];
CREATE TABLE [dbo].[QuizAttemptsLog] (
    [LogId] bigint NULL,
    [AttemptId] bigint NULL,
    [EventTypeId] int NULL,
    [Name] nvarchar(256) NULL,
    [Description] nvarchar(256) NULL,
    [EventTime] datetime2 NULL,
    [IPAddress] varchar(45) NULL,
    [UserId] int NULL,
    [IsDeleted] bit NULL
);

-- Quiz Objects
-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[QuizObjects];
CREATE TABLE [dbo].[QuizObjects] (
    [QuizId] bigint NULL,
    [QuizName] nvarchar(256) NULL,
    [QuizDescription] nvarchar(1000) NULL,
    [QuizCategory] nvarchar(256) NULL,
    [IsActive] bit NULL,
    [OrgUnitId] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [GradeObjectId] bigint NULL,
    [OverallScoreCalculation] varchar(23) NULL,
    [QuizScoreDenominator] decimal(19,9) NULL,
    [HasPassword] bit NULL,
    [IPRestricted] bit NULL,
    [TimeLimit] int NULL,
    [TimeLimitEnforced] bit NULL,
    [AttemptsAllowed] int NULL,
    [PreventMovingBackwards] bit NULL,
    [AllowHints] bit NULL,
    [NotificationEmail] nvarchar(1000) NULL,
    [DisablePagerAccess] bit NULL,
    [DisplayInCalendar] bit NULL,
    [IsAttemptRldb] bit NULL,
    [IsSubviewRldb] bit NULL,
    [SortOrder] int NULL,
    [CategoryId] bigint NULL,
    [ResultId] bigint NULL,
    [IsRetakeIncorrectOnly] bit NULL,
    [PagingTypeId] int NULL,
    [IsSynchronous] bit NULL,
    [DeductionPercentage] int NULL,
    [AIStudySupport] bit NULL,
    [HideQuestionPoints] bit NULL,
    [IsSingleSession] bit NULL,
    [HideAnnotationTools] bit NULL
);

-- Quiz Survey Sections
-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[QuizSurveySections];
CREATE TABLE [dbo].[QuizSurveySections] (
    [CollectionId] bigint NULL,
    [SectionId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [NameIsDisplayed] bit NULL,
    [IsQuestionPool] bit NULL,
    [SectionText] nvarchar(1000) NULL,
    [SectionTextIsHTML] bit NULL,
    [IsSectionTextHidden] bit NULL,
    [QuestionPoints] decimal(19,9) NULL,
    [NumQuestions] int NULL,
    [NumChoices] int NULL,
    [Shuffle] bit NULL,
    [CreationDate] datetime2 NULL,
    [CreatedBy] bigint NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Quiz User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
DROP TABLE IF EXISTS [dbo].[QuizUserAnswerResponses];
CREATE TABLE [dbo].[QuizUserAnswerResponses] (
    [AttemptId] bigint NULL,
    [AttemptNumber] int NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [AnswerId] bigint NULL,
    [SortOrder] int NULL,
    [IsCorrect] bit NULL,
    [UserSelection] bigint NULL,
    [UserAnswer] nvarchar(1000) NULL,
    [FileSetId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL
);

-- Quiz User Answers
-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
DROP TABLE IF EXISTS [dbo].[QuizUserAnswers];
CREATE TABLE [dbo].[QuizUserAnswers] (
    [AttemptId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [TimeCompleted] datetime2 NULL,
    [QuestionNumber] int NULL,
    [Comment] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [Score] decimal(19,9) NULL,
    [Page] int NULL,
    [SectionId] bigint NULL,
    [ObjectId] bigint NULL,
    [OutOf] decimal(19,9) NULL,
    [TimeStarted] datetime2 NULL,
    [IsBonus] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [QuizTimeCompleted] datetime2 NULL
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ReleaseConditionObjects];
CREATE TABLE [dbo].[ReleaseConditionObjects] (
    [PreRequisiteId] int NULL,
    [ResultId] int NULL,
    [OrgUnitId] int NULL,
    [Name] varchar(64) NULL,
    [IsNegativeCondition] bit NULL,
    [PreRequisiteToolId] int NULL,
    [Id1] int NULL,
    [Id2] int NULL,
    [ResultToolId] int NULL,
    [UsesPercentage] bit NULL,
    [OperatorTypeDesc] varchar(3) NULL,
    [Version] bigint NULL,
    [Guid1] uniqueidentifier NULL,
    [Guid2] uniqueidentifier NULL
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ReleaseConditionResults];
CREATE TABLE [dbo].[ReleaseConditionResults] (
    [ResultId] int NULL,
    [UserId] int NULL,
    [Met] varchar(7) NULL,
    [Version] bigint NULL,
    [DeletedDate] datetime2 NULL
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ReofferCourse];
CREATE TABLE [dbo].[ReofferCourse] (
    [CourseOfferingId] int NULL,
    [SourceCourseId] int NULL,
    [CreatedBy] int NULL,
    [ReofferDate] datetime2 NULL
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[RoleDetails];
CREATE TABLE [dbo].[RoleDetails] (
    [RoleId] int NULL,
    [RoleName] nvarchar(120) NULL,
    [Description] nvarchar(400) NULL,
    [IsCascading] bit NULL,
    [InClassList] bit NULL,
    [ClassListRoleName] nvarchar(120) NULL,
    [ClassListShowGroups] bit NULL,
    [ClassListShowSections] bit NULL,
    [ClassListDisplayRole] bit NULL,
    [AccessInactiveCO] bit NULL,
    [HasSpecialAccess] bit NULL,
    [AddToCourseOfferingGroups] bit NULL,
    [CanBeAutoEnrolledIntoGroups] bit NULL,
    [AddToCourseOfferingSections] bit NULL,
    [CanBeAutoEnrolledIntoSections] bit NULL,
    [AccessPastCourses] bit NULL,
    [AccessFutureCourses] bit NULL,
    [SortOrder] int NULL,
    [ShowInContent] bit NULL,
    [ShowInDiscussionAssess] bit NULL,
    [ShowInDiscussionStats] bit NULL,
    [ShowInGrades] bit NULL,
    [ShowInAttendance] bit NULL,
    [AllowSelfEnrollInGroups] bit NULL,
    [ShowInRegistration] bit NULL,
    [ShowInUserProgress] bit NULL,
    [RoleAlias] nvarchar(120) NULL,
    [RoleCode] nvarchar(100) NULL,
    [LastModifiedDate] datetime2 NULL,
    [DeletedBy] int NULL
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[RubricAssessment];
CREATE TABLE [dbo].[RubricAssessment] (
    [RubricId] bigint NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [Score] decimal(36,2) NULL,
    [AssessedByUserId] int NULL,
    [AssessmentDate] datetime2 NULL,
    [IsCompleted] bit NULL,
    [ActivityType] nvarchar(50) NULL,
    [ActivityObjectId] bigint NULL,
    [DateCreated] datetime2 NULL,
    [AssessmentId] bigint NULL,
    [LevelAchievedId] bigint NULL,
    [ActivityId] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Rubric Assessment Criteria
-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricAssessmentCriteria];
CREATE TABLE [dbo].[RubricAssessmentCriteria] (
    [AssessmentId] bigint NULL,
    [RubricId] bigint NULL,
    [Score] decimal(19,9) NULL,
    [Feedback] nvarchar(4000) NULL,
    [IsScoreOverridden] bit NULL,
    [CriterionId] bigint NULL,
    [LevelAchievedId] bigint NULL,
    [Version] bigint NULL
);

-- Rubric Criteria Levels
-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[RubricCriteriaLevels];
CREATE TABLE [dbo].[RubricCriteriaLevels] (
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [Description] nvarchar(1000) NULL,
    [Feedback] nvarchar(1000) NULL,
    [Value] decimal(19,9) NULL,
    [LevelId] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Rubric Object Criteria
-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricObjectCriteria];
CREATE TABLE [dbo].[RubricObjectCriteria] (
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [Name] nvarchar(500) NULL,
    [SortOrder] int NULL,
    [CriteriaGroupId] bigint NULL,
    [GroupName] nvarchar(256) NULL,
    [GroupSortOrder] int NULL,
    [LevelSetId] bigint NULL,
    [IsDeleted] bit NULL
);

-- Rubric Object Levels
-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricObjectLevels];
CREATE TABLE [dbo].[RubricObjectLevels] (
    [RubricId] bigint NULL,
    [LevelId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [Description] nvarchar(1000) NULL,
    [Feedback] nvarchar(1000) NULL,
    [Value] decimal(19,9) NULL,
    [RangeStartValue] decimal(19,9) NULL,
    [SortOrder] int NULL,
    [LevelSetId] bigint NULL,
    [IsDeleted] bit NULL
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[RubricObjects];
CREATE TABLE [dbo].[RubricObjects] (
    [RubricId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [RubricStatus] nvarchar(256) NULL,
    [Description] nvarchar(1000) NULL,
    [RubricType] nvarchar(256) NULL,
    [ScoringMethods] nvarchar(256) NULL,
    [IsScoreVisible] bit NULL,
    [OrgUnitID] int NULL,
    [IsShared] bit NULL,
    [IsDeleted] bit NULL
);

-- Rubrics Edit
-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricsEdit];
CREATE TABLE [dbo].[RubricsEdit] (
    [AuditLogId] uniqueidentifier NULL,
    [RubricId] bigint NULL,
    [CriterionId] bigint NULL,
    [LevelId] bigint NULL,
    [ModifiedBy] int NULL,
    [ModifiedObjectType] int NULL,
    [CriteriaGroupId] bigint NULL,
    [ModifiedDate] datetime2 NULL,
    [PreviousValue] nvarchar(4000) NULL,
    [ModifiedValue] nvarchar(4000) NULL,
    [IsLocked] bit NULL,
    [Version] int NULL
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
DROP TABLE IF EXISTS [dbo].[SCORMActivities];
CREATE TABLE [dbo].[SCORMActivities] (
    [ActivityId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [ParentActivityId] uniqueidentifier NULL,
    [NumChildren] int NULL,
    [InternalId] nvarchar(255) NULL,
    [Title] nvarchar(200) NULL,
    [CompletionThreshold] float(24) NULL,
    [PassingScore] float(24) NULL,
    [PassingScoreUsed] bit NULL,
    [ScoreMin] float(24) NULL,
    [ScoreMax] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
DROP TABLE IF EXISTS [dbo].[SCORMActivityAttempts];
CREATE TABLE [dbo].[SCORMActivityAttempts] (
    [VisitId] uniqueidentifier NULL,
    [ActivityId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [Completion] nvarchar(100) NULL,
    [Success] nvarchar(100) NULL,
    [Score] float(24) NULL,
    [ScoreRaw] float(24) NULL,
    [TimeSpent] float(24) NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
DROP TABLE IF EXISTS [dbo].[SCORMInteractionAttempts];
CREATE TABLE [dbo].[SCORMInteractionAttempts] (
    [VisitId] uniqueidentifier NULL,
    [InteractionId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [ActivityId] uniqueidentifier NULL,
    [Timestamp] datetime2 NULL,
    [Response] nvarchar(1000) NULL,
    [Result] nvarchar(100) NULL,
    [NumericResult] float(24) NULL,
    [TimeSpent] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
DROP TABLE IF EXISTS [dbo].[SCORMInteractionObjectives];
CREATE TABLE [dbo].[SCORMInteractionObjectives] (
    [InteractionId] uniqueidentifier NULL,
    [ObjectiveId] uniqueidentifier NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
DROP TABLE IF EXISTS [dbo].[SCORMInteractions];
CREATE TABLE [dbo].[SCORMInteractions] (
    [InteractionId] uniqueidentifier NULL,
    [ActivityId] uniqueidentifier NULL,
    [InternalId] nvarchar(255) NULL,
    [InteractionType] nvarchar(100) NULL,
    [Description] nvarchar(250) NULL,
    [Weighting] float(24) NULL,
    [CorrectResponses] nvarchar(2000) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
DROP TABLE IF EXISTS [dbo].[SCORMObjectiveAttempts];
CREATE TABLE [dbo].[SCORMObjectiveAttempts] (
    [VisitId] uniqueidentifier NULL,
    [ObjectiveId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [Score] float(24) NULL,
    [ScoreRaw] float(24) NULL,
    [Success] nvarchar(100) NULL,
    [Completion] nvarchar(100) NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
DROP TABLE IF EXISTS [dbo].[SCORMObjectives];
CREATE TABLE [dbo].[SCORMObjectives] (
    [ObjectiveId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [ObjectiveType] nvarchar(100) NULL,
    [ActivityId] uniqueidentifier NULL,
    [InternalId] nvarchar(255) NULL,
    [IsPrimary] bit NULL,
    [Description] nvarchar(250) NULL,
    [ScoreMin] float(24) NULL,
    [ScoreMax] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[SCORMObjects];
CREATE TABLE [dbo].[SCORMObjects] (
    [ScormObjectId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [ContentObjectId] int NULL,
    [ContentServiceContentId] uniqueidentifier NULL,
    [ContentServiceRevisionId] uniqueidentifier NULL,
    [ContentServiceTopicId] uniqueidentifier NULL,
    [Title] nvarchar(1000) NULL,
    [Description] nvarchar(1000) NULL,
    [LearningStandard] nvarchar(100) NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SCORMVisits];
CREATE TABLE [dbo].[SCORMVisits] (
    [VisitId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [FirstAccessDate] datetime2 NULL,
    [LastAccessDate] datetime2 NULL,
    [CompletedDate] datetime2 NULL,
    [Completion] nvarchar(100) NULL,
    [Success] nvarchar(100) NULL,
    [Score] float(24) NULL,
    [TimeSpent] int NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SessionHistory];
CREATE TABLE [dbo].[SessionHistory] (
    [SessionId] bigint NULL,
    [OrgId] int NULL,
    [UserId] int NULL,
    [DateStarted] datetime2 NULL,
    [DateEnded] datetime2 NULL,
    [LastAccessed] datetime2 NULL,
    [TimedOut] bit NULL,
    [HistoryID] bigint NULL
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SISCourseMergeLog];
CREATE TABLE [dbo].[SISCourseMergeLog] (
    [BatchId] uniqueidentifier NULL,
    [JobType] nvarchar(32) NULL,
    [Status] nvarchar(32) NULL,
    [OriginalTargetOrgUnitId] bigint NULL,
    [OriginalSourceOrgUnitId] bigint NULL,
    [SourceSystemId] bigint NULL,
    [NumberOfCoursesInBatch] int NULL,
    [UserId] bigint NULL,
    [ErrorType] nvarchar(48) NULL,
    [Timestamp] datetime2 NULL
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SourceCourseDeployHistory];
CREATE TABLE [dbo].[SourceCourseDeployHistory] (
    [SourceCourseDeployId] bigint NULL,
    [SourceCourseOrgUnitId] int NULL,
    [TargetCourseOrgUnitId] int NULL,
    [UserId] int NULL,
    [Status] nvarchar(128) NULL,
    [QueuedTime] datetime2 NULL,
    [CompletionTime] datetime2 NULL
);

-- Survey Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SurveyAttempts];
CREATE TABLE [dbo].[SurveyAttempts] (
    [AttemptId] bigint NULL,
    [SurveyId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [AttemptNumber] int NULL,
    [TimeStarted] datetime2 NULL,
    [TimeCompleted] datetime2 NULL,
    [AttemptedFromOrgUnitId] int NULL,
    [OldAttemptNumber] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- Survey Objects
-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[SurveyObjects];
CREATE TABLE [dbo].[SurveyObjects] (
    [SurveyId] bigint NULL,
    [SurveyName] nvarchar(1000) NULL,
    [CategoryId] bigint NULL,
    [OrgUnitId] int NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionEnabled] bit NULL,
    [HasInstantFeedback] bit NULL,
    [IsAnonymous] bit NULL,
    [IsVisible] bit NULL,
    [SubmissionMessage] nvarchar(1000) NULL,
    [Footer] nvarchar(1000) NULL,
    [FooterIsDisplayed] bit NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DisplayInCalendar] bit NULL,
    [ResultId] bigint NULL,
    [AttemptsAllowed] int NULL,
    [SortOrder] int NULL,
    [CreatedBy] int NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [Version] bigint NULL,
    [CategoryName] nvarchar(256) NULL
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
DROP TABLE IF EXISTS [dbo].[SurveyUserAnswerResponses];
CREATE TABLE [dbo].[SurveyUserAnswerResponses] (
    [AttemptId] bigint NULL,
    [AttemptNumber] int NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [AnswerId] bigint NULL,
    [SortOrder] bigint NULL,
    [IsCorrect] bit NULL,
    [UserSelection] bigint NULL,
    [UserAnswer] nvarchar(1000) NULL,
    [FileSetId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL
);

-- Survey User Answers
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SurveyUserAnswers];
CREATE TABLE [dbo].[SurveyUserAnswers] (
    [AttemptId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [TimeCompleted] datetime2 NULL,
    [QuestionNumber] int NULL,
    [Comment] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [Score] decimal(19,9) NULL,
    [Page] int NULL,
    [Assigned] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [SurveyTimeCompleted] datetime2 NULL
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SystemAccessLog];
CREATE TABLE [dbo].[SystemAccessLog] (
    [SessionId] nvarchar(36) NULL,
    [UserId] int NULL,
    [Timestamp] datetime2 NULL,
    [State] nvarchar(20) NULL,
    [Source] nvarchar(20) NULL,
    [AppVersion] nvarchar(20) NULL,
    [Device] nvarchar(50) NULL,
    [IsOfflineMode] bit NULL,
    [IPAddress] nvarchar(45) NULL
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SystemAccessSummary];
CREATE TABLE [dbo].[SystemAccessSummary] (
    [UserId] int NULL,
    [ImpersonatingUserId] int NULL,
    [LastSystemAccess] datetime2 NULL,
    [Source] nvarchar(20) NULL
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[Tools];
CREATE TABLE [dbo].[Tools] (
    [ToolId] int NULL,
    [Name] nvarchar(50) NULL,
    [DisplayName] nvarchar(200) NULL,
    [Version] bigint NULL
);

-- TurnItIn Submissions
-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
DROP TABLE IF EXISTS [dbo].[TurnItInSubmissions];
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

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserAttributeDefinitions];
CREATE TABLE [dbo].[UserAttributeDefinitions] (
    [AttributeId] nvarchar(128) NULL,
    [Name] nvarchar(128) NULL,
    [Type] nvarchar(8) NULL,
    [AllowMultiple] bit NULL,
    [IsDefault] bit NULL,
    [LastModified] datetime2 NULL,
    [ModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);

-- User Attribute Values
-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserAttributeValues];
CREATE TABLE [dbo].[UserAttributeValues] (
    [UserId] int NULL,
    [AttributeId] nvarchar(128) NULL,
    [Value] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [ModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] int NULL
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserEnrollments];
CREATE TABLE [dbo].[UserEnrollments] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [RoleName] nvarchar(60) NULL,
    [EnrollmentDate] datetime2 NULL,
    [EnrollmentType] varchar(50) NULL,
    [RoleId] int NULL
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserLogins];
CREATE TABLE [dbo].[UserLogins] (
    [UserId] int NULL,
    [UserName] nvarchar(256) NULL,
    [IP] varchar(64) NULL,
    [SessionId] int NULL,
    [StatusType] nvarchar(50) NULL,
    [AttemptDate] datetime2 NULL,
    [ImpersonatingUserId] int NULL,
    [LoginAttemptId] nvarchar(36) NULL,
    [LoginSource] nvarchar(50) NULL
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[Users];
CREATE TABLE [dbo].[Users] (
    [UserId] int NULL,
    [UserName] nvarchar(270) NULL,
    [OrgDefinedId] nvarchar(256) NULL,
    [FirstName] nvarchar(64) NULL,
    [MiddleName] nvarchar(64) NULL,
    [LastName] nvarchar(64) NULL,
    [IsActive] bit NULL,
    [ExternalEmail] nvarchar(256) NULL,
    [CreationDate] datetime2 NULL,
    [Version] bigint NULL,
    [OrgRoleId] int NULL,
    [DateDeleted] datetime2 NULL
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[VirtualClassroomUsage];
CREATE TABLE [dbo].[VirtualClassroomUsage] (
    [OrgUnitId] int NULL,
    [CourseName] nvarchar(255) NULL,
    [MeetingId] nvarchar(36) NULL,
    [MeetingName] nvarchar(255) NULL,
    [CreationUserId] int NULL,
    [CreationDate] datetime2 NULL,
    [ScheduledDate] datetime2 NULL,
    [ScheduledDuration] int NULL,
    [IsPublished] bit NULL,
    [ExternalLinksEnabled] bit NULL,
    [WholeClassInvited] bit NULL,
    [IsCancelled] bit NULL,
    [StartDateTime] datetime2 NULL,
    [EndDateTime] datetime2 NULL,
    [IsRecorded] bit NULL
);
