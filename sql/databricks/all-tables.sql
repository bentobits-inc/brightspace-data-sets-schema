-- All 144 Brightspace Data Sets tables for Databricks Runtime 13.3 LTS or later.
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Accommodations Profile Log
-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AccommodationsProfileLog` (
    `AccommodatedUserId` BIGINT,
    `OrgUnitId` BIGINT,
    `QuizTimeLimitMultiplier` DECIMAL(5,2),
    `QuizTimeLimitExtraTime` INT,
    `QuizControlAlwaysAllowRightClick` BOOLEAN,
    `ModifiedBy` BIGINT,
    `LastModified` TIMESTAMP_NTZ
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityExemptionsLog` (
    `OrgUnitId` INT,
    `UserId` INT,
    `ObjectId` INT,
    `ActivityId` STRING,
    `LogTypeName` STRING,
    `LastModifiedUtc` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `ActivityExemptionsLogId` BIGINT,
    `ToolId` INT
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityFeedCommentLog` (
    `LogId` STRING,
    `UserId` INT,
    `OrgUnitId` INT,
    `CommentId` STRING,
    `Action` STRING,
    `ActionDate` TIMESTAMP_NTZ,
    `Content` STRING,
    `PostId` STRING
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS `ActivityFeedCommentObjects` (
    `OrgUnitId` INT,
    `CommentId` STRING,
    `LastModifiedBy` INT,
    `LastModified` TIMESTAMP_NTZ,
    `Content` STRING,
    `IsDeleted` BOOLEAN,
    `PostId` STRING,
    `Version` BIGINT
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityFeedPostLog` (
    `LogId` STRING,
    `UserId` INT,
    `OrgUnitId` INT,
    `PostId` STRING,
    `PostType` STRING,
    `Action` STRING,
    `ActionDate` TIMESTAMP_NTZ,
    `DropboxId` BIGINT,
    `Content` STRING,
    `CommentCount` INT,
    `AttachmentCount` INT
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ActivityFeedPostObjects` (
    `OrgUnitId` INT,
    `PostId` STRING,
    `PostType` STRING,
    `LastModifiedBy` INT,
    `LastModified` TIMESTAMP_NTZ,
    `DropboxId` BIGINT,
    `Content` STRING,
    `IsDeleted` BOOLEAN,
    `CommentCount` INT,
    `AttachmentCount` INT,
    `Version` BIGINT
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AIConsumption` (
    `ConsumptionId` STRING,
    `UserId` INT,
    `OrgUnitId` INT,
    `Date` TIMESTAMP_NTZ,
    `GenerationCount` INT,
    `ConsumptionSource` INT
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `Announcements` (
    `AnnouncementId` BIGINT,
    `OrgUnitId` BIGINT,
    `Title` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsGlobal` BOOLEAN,
    `IsDraft` BOOLEAN,
    `NumAttachments` INT,
    `DeletedDate` TIMESTAMP_NTZ,
    `DeletedByUserId` INT,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `CreatedBy` INT,
    `IsAuthorInfoShown` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `ResultId` BIGINT
);

-- Assignment Special Access
-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AssignmentSpecialAccess` (
    `DropboxId` BIGINT,
    `UserId` INT,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `ModifiedBy` INT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `StartDateAvailabilityType` SMALLINT,
    `EndDateAvailabilityType` SMALLINT
);

-- Assignment Submission Details
-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AssignmentSubmissionDetails` (
    `SubmissionId` BIGINT,
    `DropboxId` BIGINT,
    `UserId` BIGINT,
    `GroupId` BIGINT,
    `NumberOfFilesSubmitted` INT,
    `TotalFileSize` BIGINT,
    `SubmittedByUserId` INT,
    `DateSubmitted` TIMESTAMP_NTZ,
    `Comments` STRING,
    `IsTurnItInExempt` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `IsPreview` BOOLEAN,
    `Version` BIGINT
);

-- Assignment Submissions
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

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AssignmentSummary` (
    `DropboxId` BIGINT,
    `OrgUnitId` INT,
    `Name` STRING,
    `Category` STRING,
    `Type` STRING,
    `GradeItemId` BIGINT,
    `PossibleScore` DECIMAL(19,9),
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `IsRestricted` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `TurnItInEnabled` BOOLEAN,
    `IsHidden` BOOLEAN,
    `SortOrder` INT,
    `SubmissionType` STRING,
    `CompletionType` STRING,
    `ResultId` INT,
    `CategoryId` BIGINT,
    `Version` BIGINT,
    `StartDateAvailabilityType` SMALLINT,
    `EndDateAvailabilityType` SMALLINT,
    `AIUtilization` INT,
    `Instructions` STRING
);

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceRegisters` (
    `AttendanceRegisterId` BIGINT,
    `OrgUnitId` INT,
    `Name` STRING,
    `Description` STRING,
    `SchemeId` BIGINT,
    `IsVisible` BOOLEAN,
    `IncludeAllUsers` BOOLEAN,
    `CauseForConcern` DECIMAL(19,9),
    `Version` BIGINT,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceSchemes` (
    `SchemeId` BIGINT,
    `OrgUnitId` INT,
    `SchemeName` STRING,
    `SchemeSymbolId` BIGINT,
    `SymbolName` STRING,
    `SymbolValue` STRING,
    `Percentage` DECIMAL(19,9),
    `Version` BIGINT,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
CREATE TABLE IF NOT EXISTS `AttendanceSessions` (
    `AttendanceSessionId` BIGINT,
    `AttendanceRegisterId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `SortOrder` INT,
    `Version` BIGINT,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS `AttendanceUserSessions` (
    `UserId` INT,
    `AttendanceSessionId` BIGINT,
    `SchemeSymbolId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS `AudioVideoProcessed` (
    `ContentId` STRING,
    `RevisionId` STRING,
    `RevisionNumber` INT,
    `Type` STRING,
    `Source` STRING,
    `RevisionSize` BIGINT,
    `Duration` INT,
    `RequiredTranscoding` BOOLEAN,
    `RequiredTranscribing` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AuditorRelationshipsLog` (
    `AuditorId` INT,
    `UserToAuditId` INT,
    `OrgUnitId` INT,
    `Action` STRING,
    `ModifiedBy` INT,
    `ModifiedDate` TIMESTAMP_NTZ
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `AwardObjects` (
    `AwardId` BIGINT,
    `Name` STRING,
    `AwardTypeId` INT,
    `Type` STRING,
    `Description` STRING,
    `ExpiryCalculationType` STRING,
    `ExpiryNotificationType` STRING,
    `ExpiryDate` TIMESTAMP_NTZ,
    `ImagePath` STRING,
    `CreatedByUserId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `Criteria` STRING
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
CREATE TABLE IF NOT EXISTS `AwardsIssued` (
    `AwardId` BIGINT,
    `OrgUnitId` BIGINT,
    `UserId` BIGINT,
    `IssuedBy` INT,
    `IssueDate` TIMESTAMP_NTZ,
    `ExpiryDate` TIMESTAMP_NTZ,
    `IssuedId` BIGINT,
    `Criteria` STRING,
    `Evidence` STRING,
    `RevokedDate` TIMESTAMP_NTZ,
    `RevokedReason` STRING,
    `RevokedBy` BIGINT,
    `LastModifiedBy` BIGINT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `CertificateId` STRING
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `BrightspaceEmailLog` (
    `MailId` INT,
    `SenderUserId` INT,
    `SenderAddress` STRING,
    `RecipientAddress` STRING,
    `RecipientType` STRING,
    `DateTimeSent` TIMESTAMP_NTZ,
    `Subject` STRING
);

-- Calendar Events
-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CalendarEvents` (
    `ScheduleId` BIGINT,
    `OrgUnitId` BIGINT,
    `UserId` BIGINT,
    `Title` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `TimeZoneIdentifier` STRING,
    `IsAllDayEvent` BOOLEAN,
    `RecurrenceType` STRING,
    `RecurrenceInterval` INT,
    `CreatedByUserId` INT,
    `LastModified` TIMESTAMP_NTZ,
    `EventObjectTypeName` STRING,
    `ObjectLookupId1` BIGINT,
    `ObjectLookupId2` BIGINT
);

-- Checklist Category Details
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistCategoryDetails` (
    `CategoryId` BIGINT,
    `ChecklistId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `DescriptionIsHtml` BOOLEAN,
    `SortOrder` INT,
    `LastModifiedUtc` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT,
    `Version` BIGINT
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistCompletions` (
    `UserId` INT,
    `DateCompleted` TIMESTAMP_NTZ,
    `ItemId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `IsCompleted` BOOLEAN,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT,
    `Version` BIGINT
);

-- Checklist Item Details
-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistItemDetails` (
    `ItemId` BIGINT,
    `CategoryId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `DescriptionIsHtml` BOOLEAN,
    `DueDate` TIMESTAMP_NTZ,
    `ScheduleId` INT,
    `SortOrder` INT,
    `IsAutoChecked` BOOLEAN,
    `LastModifiedUtc` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT,
    `Version` BIGINT
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ChecklistObjects` (
    `ChecklistId` BIGINT,
    `OrgUnitId` INT,
    `Name` STRING,
    `Description` STRING,
    `DescriptionIsHtml` BOOLEAN,
    `SharedUserId` INT,
    `DisplayInNewWindow` BOOLEAN,
    `SortOrder` INT,
    `Version` BIGINT,
    `ResultId` INT,
    `DateDeleted` TIMESTAMP_NTZ,
    `DeletedBy` INT
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyActivities` (
    `ActivityId` BIGINT,
    `OrgUnitId` INT,
    `ActivityName` STRING,
    `ActivityTypeId` INT,
    `AssessmentType` STRING,
    `ObjectLookupId` BIGINT,
    `RubricId` BIGINT,
    `LevelId` BIGINT,
    `RubricCriterionId` BIGINT,
    `AssessmentThresholdCriteria` STRING,
    `AssessmentThreshold` DECIMAL(19,9),
    `IsAutoEval` BOOLEAN,
    `RubricName` STRING,
    `RubricLevelRequired` STRING,
    `ObjectId` BIGINT,
    `ActivityType` STRING,
    `Version` BIGINT
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `CompetencyActivityLog` (
    `ActivityId` BIGINT,
    `ActivityLogId` BIGINT,
    `LogTypeId` INT,
    `LogTypeName` STRING,
    `LogDateTime` TIMESTAMP_NTZ,
    `ModifiedBy` BIGINT
);

-- Competency Activity Results
-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CompetencyActivityResults` (
    `ActivityId` BIGINT,
    `OrgUnitId` INT,
    `UserId` INT,
    `LearningObjectId` BIGINT,
    `IsAchieved` BOOLEAN,
    `PercentAchieved` DECIMAL(19,9),
    `RubricScore` DECIMAL(19,9),
    `RubricLevelAchieved` STRING,
    `RubricId` BIGINT,
    `RubricCriterionId` BIGINT,
    `AchievedDate` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS `CompetencyLog` (
    `CompetencyLogId` BIGINT,
    `LogTypeId` INT,
    `LogTypeName` STRING,
    `ObjectId` BIGINT,
    `ObjectTypeId` INT,
    `ObjectTypeName` STRING,
    `ObjectVersion` INT,
    `LogDateTime` TIMESTAMP_NTZ,
    `ModifiedBy` BIGINT,
    `IndirectObjectId` BIGINT,
    `IndirectObjectTypeName` STRING,
    `IndirectObjectTypeId` INT,
    `IndirectObjectVersion` INT
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyObjects` (
    `ObjectId` BIGINT,
    `OrgUnitId` INT,
    `Name` STRING,
    `Type` STRING,
    `ReadyForEvaluation` BOOLEAN,
    `Status` STRING,
    `Description` STRING,
    `NeedReevaluation` BOOLEAN,
    `ReevaluationIfAchieved` BOOLEAN,
    `ReevaluationIfNotAchieved` BOOLEAN,
    `AdditionalIdentifier` STRING,
    `IsHidden` BOOLEAN
);

-- Competency Structure
-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS `CompetencyStructure` (
    `ObjectId` BIGINT,
    `ParentObjectId` BIGINT,
    `BaseObjectID` BIGINT,
    `Depth` INT,
    `EntryTime` INT
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ContentFilesPropertiesLog` (
    `OrgUnitId` INT,
    `ContentObjectId` INT,
    `Action` STRING,
    `FilePath` STRING,
    `FileName` STRING,
    `FileExtension` STRING,
    `FileSizeBytes` BIGINT,
    `UploadDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `LastModified` TIMESTAMP_NTZ
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS `ContentObjects` (
    `ContentObjectId` INT,
    `OrgUnitId` INT,
    `Title` STRING,
    `ContentObjectType` STRING,
    `CompletionType` STRING,
    `ParentContentObjectId` INT,
    `Location` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `ObjectId1` INT,
    `ObjectId2` INT,
    `ObjectId3` INT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `SortOrder` INT,
    `Depth` INT,
    `ToolId` INT,
    `IsHidden` BOOLEAN,
    `ResultId` INT,
    `DeletedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedBy` INT,
    `DeletedBy` INT,
    `AIUtilization` INT,
    `Version` BIGINT
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ContentUserCompletion` (
    `ContentObjectId` INT,
    `OrgUnitId` INT,
    `UserId` INT,
    `DateCompleted` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `AutomaticDateCompleted` TIMESTAMP_NTZ,
    `ManualDateCompleted` TIMESTAMP_NTZ
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ContentUserProgress` (
    `ContentObjectId` INT,
    `UserId` INT,
    `CompletedDate` TIMESTAMP_NTZ,
    `LastVisited` TIMESTAMP_NTZ,
    `IsRead` BOOLEAN,
    `NumRealVisits` INT,
    `NumFakeVisits` INT,
    `TotalTime` BIGINT,
    `IsVisited` BOOLEAN,
    `IsCurrentBookmark` BOOLEAN,
    `IsSelfAssessComplete` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseAccess` (
    `OrgUnitId` INT,
    `UserId` INT,
    `DayAccessed` TIMESTAMP_NTZ
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseAccessLog` (
    `OrgUnitId` INT,
    `UserId` INT,
    `Timestamp` TIMESTAMP_NTZ,
    `Source` STRING
);

-- Course Awards
-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CourseAwards` (
    `AssociationId` BIGINT,
    `AwardId` BIGINT,
    `OrgUnitId` BIGINT,
    `DateCreated` TIMESTAMP_NTZ,
    `HiddenAward` BOOLEAN,
    `ConditionSetId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `Credits` DECIMAL(9,2),
    `IsAssociated` BOOLEAN,
    `Version` BIGINT
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseCopyLogs` (
    `SourceOrgUnitId` INT,
    `DestinationOrgUnitId` INT,
    `UserId` BIGINT,
    `Status` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsDestinationNew` BOOLEAN,
    `CopyProtectedResources` BOOLEAN,
    `CopyCourseJobId` BIGINT,
    `StatusId` INT
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CoursePublisherLaunches` (
    `LaunchId` STRING,
    `OrgUnitId` INT,
    `RecipientId` STRING,
    `UserId` INT,
    `RoleId` INT,
    `LaunchMethod` STRING,
    `ExternalUserId` STRING,
    `ExternalLMSType` STRING,
    `IsNewUser` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CoursePublisherRecipients` (
    `RecipientID` STRING,
    `Name` STRING,
    `CreatedAt` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDCategories` (
    `CategoryId` INT,
    `Name` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS `CPDJobTargets` (
    `PrincipalId` INT,
    `CategoryId` INT,
    `JobTitle` STRING,
    `StructuredMinutes` INT,
    `UnstructuredMinutes` INT,
    `StructuredRecordCount` INT,
    `UnstructuredRecordCount` INT,
    `StartDate` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDMethods` (
    `MethodId` INT,
    `Name` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDQuestionAnswers` (
    `AnswerId` INT,
    `AnswerText` STRING,
    `QuestionId` INT,
    `RecordId` INT,
    `UserId` INT,
    `Action` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDQuestions` (
    `QuestionId` INT,
    `QuestionText` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDUserRecords` (
    `RecordId` INT,
    `RecordName` STRING,
    `State` STRING,
    `UserId` INT,
    `Category` INT,
    `Method` INT,
    `CreditMinutes` INT,
    `Evidence` STRING,
    `Type` STRING,
    `Grade` DECIMAL(4,3),
    `DateCompleted` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDUserTargets` (
    `PrincipalId` INT,
    `CategoryId` INT,
    `UserId` INT,
    `StructuredMinutes` INT,
    `UnstructuredMinutes` INT,
    `StructuredRecordCount` INT,
    `UnstructuredRecordCount` INT,
    `StartDate` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CreatorPracticesAdoption` (
    `ActivityInstanceId` INT,
    `CreatedById` INT,
    `OrgUnitId` INT,
    `PracticeType` STRING,
    `PracticeTitle` STRING,
    `ProviderObjectId` INT,
    `CreatedDate` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CreatorPracticesEngagement` (
    `PracticeEngagementId` INT,
    `UserId` INT,
    `OrgUnitId` INT,
    `CompletionStatus` STRING,
    `ActivityInstanceId` INT,
    `CompletionDate` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionForums` (
    `OrgUnitId` INT,
    `ForumId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `MustPostToParticipate` BOOLEAN,
    `AllowAnon` BOOLEAN,
    `IsHidden` BOOLEAN,
    `RequiresApproval` BOOLEAN,
    `SortOrder` INT,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `DeletedByUserId` INT,
    `ResultId` INT,
    `StartDate` TIMESTAMP_NTZ,
    `StartDateAvailabilityType` SMALLINT,
    `EndDate` TIMESTAMP_NTZ,
    `EndDateAvailabilityType` SMALLINT,
    `Version` BIGINT
);

-- Discussion Posts
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionPosts` (
    `OrgUnitId` INT,
    `TopicId` BIGINT,
    `UserId` INT,
    `PostId` BIGINT,
    `ThreadId` BIGINT,
    `IsReply` BOOLEAN,
    `ParentPostId` BIGINT,
    `NumReplies` INT,
    `DatePosted` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `RatingSum` BIGINT,
    `NumRatings` BIGINT,
    `Score` DECIMAL(19,9),
    `LastEditDate` TIMESTAMP_NTZ,
    `SortOrder` INT,
    `Depth` INT,
    `Thread` STRING,
    `WordCount` INT,
    `AttachmentCount` INT,
    `Version` BIGINT
);

-- Discussion Posts Read Status
-- Primary key (informational, not enforced): UserId, PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): PostId -> DiscussionPosts.PostId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionPostsReadStatus` (
    `TopicId` BIGINT,
    `UserId` INT,
    `PostId` BIGINT,
    `IsRead` BOOLEAN,
    `FirstReadDate` TIMESTAMP_NTZ,
    `LastReadDate` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionTopicUserScores` (
    `UserId` INT,
    `TopicId` BIGINT,
    `Score` DECIMAL(19,9),
    `IsGraded` BOOLEAN,
    `Version` BIGINT,
    `IsDeleted` BOOLEAN
);

-- Discussion Topics
-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionTopics` (
    `OrgUnitId` INT,
    `TopicId` BIGINT,
    `ForumId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `MustPostToParticipate` BOOLEAN,
    `AllowAnon` BOOLEAN,
    `IsHidden` BOOLEAN,
    `RequiresApproval` BOOLEAN,
    `LastPostDate` TIMESTAMP_NTZ,
    `LastPostUserId` BIGINT,
    `NumViews` BIGINT,
    `SortOrder` INT,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `DeletedByUserId` INT,
    `GradeItemId` INT,
    `ScoreOutOf` DOUBLE,
    `ScoreCalculationMethod` STRING,
    `IncludeNonScoredValues` BOOLEAN,
    `Version` BIGINT,
    `ResultId` INT,
    `StartDate` TIMESTAMP_NTZ,
    `StartDateAvailabilityType` SMALLINT,
    `EndDate` TIMESTAMP_NTZ,
    `EndDateAvailabilityType` SMALLINT,
    `AIUtilization` INT,
    `DueDate` TIMESTAMP_NTZ
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `EnrollmentsAndWithdrawals` (
    `LogId` BIGINT,
    `UserId` INT,
    `OrgUnitId` INT,
    `RoleId` INT,
    `Action` STRING,
    `ModifiedByUserId` INT,
    `EnrollmentDate` TIMESTAMP_NTZ
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeBookSettings` (
    `OrgUnitId` INT,
    `GradeSchemeId` BIGINT,
    `GradingSystem` STRING,
    `UngradedItems` STRING,
    `IsAdjustedFinalGradeReleased` BOOLEAN,
    `IsCalculatedFinalGradeReleased` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeObjects` (
    `GradeObjectId` INT,
    `OrgUnitId` INT,
    `ParentGradeObjectId` INT,
    `Name` STRING,
    `TypeName` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsAutoPointed` BOOLEAN,
    `IsFormula` BOOLEAN,
    `IsBonus` BOOLEAN,
    `MaxPoints` DECIMAL(19,9),
    `CanExceedMaxGrade` BOOLEAN,
    `ExcludeFromFinalGradeCalc` BOOLEAN,
    `GradeSchemeId` BIGINT,
    `Weight` DECIMAL(19,9),
    `NumLowestGradesToDrop` INT,
    `NumHighestGradesToDrop` INT,
    `WeightDistributionType` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `ToolName` STRING,
    `AssociatedToolItemId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `ShortName` STRING,
    `GradeObjectTypeId` INT,
    `SortOrder` INT,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `DeletedByUserId` INT,
    `ResultId` INT,
    `ToolId` INT,
    `Version` INT
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeObjectsLog` (
    `LogId` BIGINT,
    `Name` STRING,
    `GradeObjectId` INT,
    `UserId` INT,
    `GradeSymbolString` STRING,
    `PointsDenominator` DECIMAL(19,9),
    `PointsNumerator` DECIMAL(19,9),
    `WeightedDenominator` DECIMAL(19,9),
    `WeightedNumerator` DECIMAL(19,9),
    `Modified` TIMESTAMP_NTZ,
    `ModifiedBy` INT
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeResults` (
    `GradeObjectId` INT,
    `OrgUnitId` INT,
    `UserId` INT,
    `PointsNumerator` DECIMAL(19,9),
    `PointsDenominator` DECIMAL(19,9),
    `WeightedNumerator` DECIMAL(19,9),
    `WeightedDenominator` DECIMAL(19,9),
    `IsReleased` BOOLEAN,
    `IsDropped` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `Comments` STRING,
    `PrivateComments` STRING,
    `GradeText` STRING,
    `GradeReleasedDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `IsDeleted` BOOLEAN
);

-- Grade Scheme Ranges
-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS `GradeSchemeRanges` (
    `GradeSchemeRangeId` BIGINT,
    `GradeSchemeId` BIGINT,
    `SymbolString` STRING,
    `AssignedValue` DECIMAL(19,9),
    `RangeStart` DECIMAL(19,9),
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeSchemes` (
    `GradeSchemeId` BIGINT,
    `OrgUnitId` INT,
    `SchemeName` STRING,
    `DeletedDate` TIMESTAMP_NTZ,
    `Version` BIGINT
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `IntelligentAgentObjects` (
    `AgentId` BIGINT,
    `OrgUnitId` INT,
    `AgentName` STRING,
    `Description` STRING,
    `Enabled` BOOLEAN,
    `SpecificRoles` STRING,
    `LoginConditionEnabled` BOOLEAN,
    `LoginConditionThreshold` INT,
    `LoginConditionType` STRING,
    `AccessConditionEnabled` BOOLEAN,
    `AccessConditionThreshold` INT,
    `AccessConditionType` STRING,
    `ResultId` BIGINT,
    `RepeatType` STRING,
    `EmailWhenSatisfied` BOOLEAN,
    `EnableSchedule` BOOLEAN,
    `ScheduleType` STRING,
    `ScheduleRepeatsEvery` INT,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Intelligent Agent Run Log
-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunLog` (
    `AgentId` BIGINT,
    `AgentRunId` BIGINT,
    `IsPracticeRun` BOOLEAN,
    `IsRunNow` BOOLEAN,
    `NumUsers` INT,
    `NumUsersWithErrors` INT,
    `NumUsersWithInfos` INT,
    `NumUsersWithWarnings` INT,
    `RunUserId` INT,
    `RunDate` TIMESTAMP_NTZ
);

-- Intelligent Agent Run Users
-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunUsers` (
    `AgentId` BIGINT,
    `AgentRunId` BIGINT,
    `UserId` INT,
    `OrgUnitId` INT,
    `ActionTypeName` STRING,
    `ActionHasError` BOOLEAN,
    `ActionHasInfo` BOOLEAN,
    `ActionHasWarning` BOOLEAN,
    `ShouldRetry` BOOLEAN
);

-- JIT Provisioned Users Log
-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `JITProvisionedUsersLog` (
    `UserId` INT,
    `MappingField` STRING,
    `MappingFieldValue` STRING,
    `ProviderType` STRING,
    `ProviderId` STRING,
    `RoleId` INT,
    `Timestamp` TIMESTAMP_NTZ,
    `Action` STRING
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LocalAuthenticationSecurityLog` (
    `UserId` INT,
    `Action` STRING,
    `ModifiedBy` INT,
    `ModifiedDate` TIMESTAMP_NTZ
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageDeploymentAudit` (
    `Action` STRING,
    `DeploymentID` STRING,
    `ClientID` STRING,
    `DeploymentName` STRING,
    `IsDeploymentEnabled` BOOLEAN,
    `HasAssignmentsAndGrades` BOOLEAN,
    `HasDeepLinking` BOOLEAN,
    `HasNamesAndRoles` BOOLEAN,
    `HasSubmissionReview` BOOLEAN,
    `HasActivityItemProfile` BOOLEAN,
    `HasPlatformNotificationService` BOOLEAN,
    `HasContextCopy` BOOLEAN,
    `ModifiedBy` BIGINT,
    `Anonymous` BOOLEAN,
    `PreProvisioningEnabled` BOOLEAN,
    `SendOrgUnitInfo` BOOLEAN,
    `SendUserFirstName` BOOLEAN,
    `SendUserMiddleName` BOOLEAN,
    `SendUserLastName` BOOLEAN,
    `SendUserEmail` BOOLEAN,
    `SendBrightspaceUserID` BOOLEAN,
    `SendBrightspaceUsername` BOOLEAN,
    `SendBrightspaceOrgDefinedId` BOOLEAN,
    `SendLinkTitle` BOOLEAN,
    `SendLinkDescription` BOOLEAN,
    `OpenAsExternal` BOOLEAN,
    `AutoMigrateLinks` BOOLEAN,
    `IsSharedToManyOrgUnits` BOOLEAN,
    `AutoCreateGrades` BOOLEAN,
    `IncludeInFinalGrade` BOOLEAN,
    `Timestamp` TIMESTAMP_NTZ,
    `HasAssetProcessor` BOOLEAN
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageRegistrationAudit` (
    `Action` STRING,
    `ClientId` STRING,
    `ToolName` STRING,
    `Domain` STRING,
    `RedirectURLs` STRING,
    `KeysetURL` STRING,
    `LoginURL` STRING,
    `LTIVersion` STRING,
    `IsRegistrationEnabled` BOOLEAN,
    `SendInstitutionRole` BOOLEAN,
    `TargetLinkURI` STRING,
    `ModifiedBy` BIGINT,
    `HasAssignmentAndGradeServices` BOOLEAN,
    `HasSubmissionReview` BOOLEAN,
    `HasDeepLinking` BOOLEAN,
    `HasNamesAndRoleProvisioningServices` BOOLEAN,
    `HasActivityItemProfile` BOOLEAN,
    `HasPlatformNotificationService` BOOLEAN,
    `Timestamp` TIMESTAMP_NTZ,
    `HasAssetProcessor` BOOLEAN
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS `LTILaunches` (
    `LTILaunchId` STRING,
    `UserId` INT,
    `IMSRoleNames` STRING,
    `ImpersonatingUserId` BIGINT,
    `ImpersonatingUserIMSRoleNames` STRING,
    `LaunchDate` TIMESTAMP_NTZ,
    `OrgUnitId` BIGINT,
    `LTILinkId` BIGINT,
    `DeploymentId` STRING,
    `ClientId` STRING,
    `ToolProviderId` STRING,
    `ContentTopicId` BIGINT,
    `ParentModuleId` BIGINT,
    `Placement` STRING,
    `MessageVersion` STRING,
    `RequestType` STRING
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTILinkMigrationAudit` (
    `LTIMigrationId` STRING,
    `UserId` BIGINT,
    `MigrationDate` TIMESTAMP_NTZ,
    `OrgUnitId` BIGINT,
    `LinkId` BIGINT,
    `LinkURL` STRING,
    `LinkName` STRING,
    `ClientId` STRING,
    `RegistrationDomain` STRING,
    `DeploymentId` STRING,
    `JobId` BIGINT,
    `Status` SMALLINT,
    `FailureCode` SMALLINT,
    `MigrationType` SMALLINT,
    `LegacyURL` STRING
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `LTILinks` (
    `LtiLinkId` BIGINT,
    `OrgUnitId` INT,
    `Title` STRING,
    `LinkType` INT,
    `LTIVersion` STRING,
    `Url` STRING,
    `Description` STRING,
    `IsVisible` BOOLEAN,
    `SendTCInfo` BOOLEAN,
    `SendContextInfo` BOOLEAN,
    `SendCourseInfo` BOOLEAN,
    `SendOrgUnitInfo` BOOLEAN,
    `SendUserId` BOOLEAN,
    `SendUserName` BOOLEAN,
    `SendUserEmail` BOOLEAN,
    `SendLinkTitle` BOOLEAN,
    `SendLinkDescription` BOOLEAN,
    `SendD2LUserName` BOOLEAN,
    `SendD2LOrgDefinedId` BOOLEAN,
    `SendD2LOrgRoleId` BOOLEAN,
    `SendBrightspaceUserId` BOOLEAN,
    `Anonymous` BOOLEAN,
    `Shared` BOOLEAN,
    `UseToolProviderSecuritySettings` BOOLEAN,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `OuAvailabilitySetId` BIGINT,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `DeploymentId` STRING,
    `LinkSubType` INT
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `MediaConsumptionLog` (
    `LogId` STRING,
    `UserId` INT,
    `ContentId` STRING,
    `RevisionId` STRING,
    `ContentType` STRING,
    `ClientApp` STRING,
    `DateConsumed` TIMESTAMP_NTZ,
    `DurationPercentageWatched` INT
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `MediaObjects` (
    `ContentId` STRING,
    `Title` STRING,
    `RevisionCount` INT,
    `OwnerId` INT,
    `LastModified` TIMESTAMP_NTZ
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitAncestors` (
    `OrgUnitId` INT,
    `AncestorOrgUnitId` INT,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitDescendants` (
    `OrgUnitId` INT,
    `DescendantOrgUnitId` INT,
    `LastModified` TIMESTAMP_NTZ,
    `DateDeleted` TIMESTAMP_NTZ
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitParents` (
    `OrgUnitId` INT,
    `ParentOrgUnitId` INT,
    `RowVersion` BIGINT,
    `DateDeleted` TIMESTAMP_NTZ
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitRecentAccess` (
    `OrgUnitId` INT,
    `UserId` INT,
    `LastAccessedDate` TIMESTAMP_NTZ
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `OrganizationalUnits` (
    `OrgUnitId` INT,
    `Organization` STRING,
    `Type` STRING,
    `Name` STRING,
    `Code` STRING,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `IsActive` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN,
    `DeletedDate` TIMESTAMP_NTZ,
    `RecycledDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `OrgUnitTypeId` INT
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomeDetails` (
    `OutcomeId` STRING,
    `OutcomeDefinitionSource` STRING,
    `OutcomeDefinitionId` STRING,
    `ParentOutcomeId` STRING,
    `Description` STRING,
    `Notation` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesAlignedToToolObjects` (
    `ObjectType` INT,
    `ObjectId` STRING,
    `OutcomeId` STRING,
    `RegistryId` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `AIUtilization` INT
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS `OutcomesAssessedCheckpoints` (
    `CheckpointId` STRING,
    `DemonstrationId` STRING,
    `Feedback` STRING,
    `ConfigDecayRate` INT,
    `ConfigAggregationMethod` INT,
    `ConfigIncludedActivities` INT,
    `ConfigMultipleAttemptStrategy` INT,
    `ConfigRecentlyAssessedActivityCount` INT,
    `ConfigTieBreaker` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `HasMetAchievementThreshold` BOOLEAN,
    `AchievedLevelId` STRING
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesCourseSpecificScales` (
    `OrgUnitId` INT,
    `RegistryId` STRING,
    `ScaleId` STRING,
    `AchievementThreshold` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesDemonstrations` (
    `DemonstrationId` STRING,
    `ExplicitlyEnteredScaleLevelId` STRING,
    `AutomaticallyGeneratedScaleLevelId` STRING,
    `AlignedObjectType` INT,
    `AlignedObjectId` STRING,
    `OutcomeId` STRING,
    `RegistryId` STRING,
    `IsPublished` BOOLEAN,
    `AssessedUserId` INT,
    `AssessedDate` TIMESTAMP_NTZ,
    `AssessorUserId` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
CREATE TABLE IF NOT EXISTS `OutcomesInRegistries` (
    `OutcomeId` STRING,
    `RegistryId` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Outcomes Rubric Alignments
-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
CREATE TABLE IF NOT EXISTS `OutcomesRubricAlignments` (
    `RubricId` BIGINT,
    `CriterionId` BIGINT,
    `OutcomeId` STRING,
    `RegistryId` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesScaleDefinition` (
    `ScaleId` STRING,
    `Name` STRING,
    `IsDefault` BOOLEAN,
    `UsePercentages` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `AchievementThreshold` STRING
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesScaleLevelDefinition` (
    `ScaleLevelId` STRING,
    `ScaleId` STRING,
    `Name` STRING,
    `SortOrder` INT,
    `PercentageRangeStart` INT,
    `RGB` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesSetCourse` (
    `RegistryId` STRING,
    `OrgUnitId` BIGINT,
    `SourceOutcomeSetId` BIGINT,
    `IsPrimary` BOOLEAN,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `ScaleId` STRING,
    `AchievementThreshold` STRING
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesSetOrg` (
    `OutcomeSetId` BIGINT,
    `OutcomeSetName` STRING,
    `RegistryId` STRING,
    `CreatedDate` TIMESTAMP_NTZ,
    `CreatedBy` INT,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `ScaleId` STRING
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `PortfolioCategories` (
    `CategoryId` STRING,
    `OrgUnitId` INT,
    `Name` STRING,
    `IsRetired` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceCategories` (
    `CategoryId` STRING,
    `EvidenceId` STRING,
    `Group` STRING,
    `IsDeleted` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceLog` (
    `LogId` STRING,
    `ParentObjectId` STRING,
    `ObjectId` STRING,
    `ObjectType` STRING,
    `UserId` INT,
    `OrgUnitId` INT,
    `Action` STRING,
    `IsMobile` BOOLEAN,
    `ActionDate` TIMESTAMP_NTZ
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceObjects` (
    `EvidenceId` STRING,
    `OwnerId` INT,
    `OrgUnitId` INT,
    `EvidenceType` STRING,
    `Title` STRING,
    `IsApproved` BOOLEAN,
    `IsSpotlighted` BOOLEAN,
    `IsSharedToParents` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `IsRecoverableByInstructor` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `IsSharedWithInstructor` BOOLEAN,
    `DateSharedWithInstructor` TIMESTAMP_NTZ
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `PreRequisiteConditionsMet` (
    `PreRequisiteId` INT,
    `UserId` INT,
    `DateMet` TIMESTAMP_NTZ,
    `Action` STRING,
    `LastModified` TIMESTAMP_NTZ
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionAnswerOptions` (
    `AnswerId` BIGINT,
    `AnswerText` STRING,
    `Weight` DECIMAL(19,9),
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `AnswerOptionId` INT
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionAnswers` (
    `AnswerId` BIGINT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `SortOrder` INT,
    `Weight` DECIMAL(19,9),
    `Answer` STRING,
    `Comment` STRING,
    `Description` STRING
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionLibrary` (
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `IsAutoGraded` BOOLEAN,
    `TemplateTypeId` INT,
    `QuestionType` STRING,
    `Name` STRING,
    `Question` STRING,
    `Comment` STRING,
    `AnswerKey` STRING,
    `CreationDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `AllowsAttachments` BOOLEAN,
    `AIUtilization` INT
);

-- Question Pools
-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionPools` (
    `SectionId` BIGINT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Question Relationships
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionRelationships` (
    `CollectionId` BIGINT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `Order` BIGINT,
    `SectionId` BIGINT,
    `IsQuestionPool` BOOLEAN,
    `CreationDate` TIMESTAMP_NTZ,
    `CreatedBy` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` BIGINT,
    `Points` DECIMAL(19,9),
    `Difficulty` INT,
    `IsBonus` BOOLEAN,
    `IsMandatory` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT,
    `ObjectId` BIGINT
);

-- Quiz Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttempts` (
    `AttemptId` BIGINT,
    `QuizId` BIGINT,
    `UserId` INT,
    `OrgUnitId` INT,
    `AttemptNumber` INT,
    `TimeStarted` TIMESTAMP_NTZ,
    `TimeCompleted` TIMESTAMP_NTZ,
    `Score` DECIMAL(19,9),
    `IsGraded` BOOLEAN,
    `OldAttemptNumber` INT,
    `IsDeleted` BOOLEAN,
    `PossibleScore` DECIMAL(19,9),
    `IsRetakeIncorrectOnly` BOOLEAN,
    `DueDate` TIMESTAMP_NTZ,
    `TimeLimit` INT,
    `TimeLimitEnforced` BOOLEAN,
    `TimeLimitExceededBehaviour` STRING,
    `IsSynchronous` BOOLEAN,
    `DeductionPercentage` INT,
    `Version` BIGINT
);

-- Quiz Attempts Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttemptsLog` (
    `LogId` BIGINT,
    `AttemptId` BIGINT,
    `EventTypeId` INT,
    `Name` STRING,
    `Description` STRING,
    `EventTime` TIMESTAMP_NTZ,
    `IPAddress` STRING,
    `UserId` INT,
    `IsDeleted` BOOLEAN
);

-- Quiz Objects
-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `QuizObjects` (
    `QuizId` BIGINT,
    `QuizName` STRING,
    `QuizDescription` STRING,
    `QuizCategory` STRING,
    `IsActive` BOOLEAN,
    `OrgUnitId` INT,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DueDate` TIMESTAMP_NTZ,
    `CreationDate` TIMESTAMP_NTZ,
    `CreatedBy` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` BIGINT,
    `GradeObjectId` BIGINT,
    `OverallScoreCalculation` STRING,
    `QuizScoreDenominator` DECIMAL(19,9),
    `HasPassword` BOOLEAN,
    `IPRestricted` BOOLEAN,
    `TimeLimit` INT,
    `TimeLimitEnforced` BOOLEAN,
    `AttemptsAllowed` INT,
    `PreventMovingBackwards` BOOLEAN,
    `AllowHints` BOOLEAN,
    `NotificationEmail` STRING,
    `DisablePagerAccess` BOOLEAN,
    `DisplayInCalendar` BOOLEAN,
    `IsAttemptRldb` BOOLEAN,
    `IsSubviewRldb` BOOLEAN,
    `SortOrder` INT,
    `CategoryId` BIGINT,
    `ResultId` BIGINT,
    `IsRetakeIncorrectOnly` BOOLEAN,
    `PagingTypeId` INT,
    `IsSynchronous` BOOLEAN,
    `DeductionPercentage` INT,
    `AIStudySupport` BOOLEAN,
    `HideQuestionPoints` BOOLEAN,
    `IsSingleSession` BOOLEAN,
    `HideAnnotationTools` BOOLEAN
);

-- Quiz Survey Sections
-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizSurveySections` (
    `CollectionId` BIGINT,
    `SectionId` BIGINT,
    `Name` STRING,
    `NameIsDisplayed` BOOLEAN,
    `IsQuestionPool` BOOLEAN,
    `SectionText` STRING,
    `SectionTextIsHTML` BOOLEAN,
    `IsSectionTextHidden` BOOLEAN,
    `QuestionPoints` DECIMAL(19,9),
    `NumQuestions` INT,
    `NumChoices` INT,
    `Shuffle` BOOLEAN,
    `CreationDate` TIMESTAMP_NTZ,
    `CreatedBy` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` BIGINT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Quiz User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS `QuizUserAnswerResponses` (
    `AttemptId` BIGINT,
    `AttemptNumber` INT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `AnswerId` BIGINT,
    `SortOrder` INT,
    `IsCorrect` BOOLEAN,
    `UserSelection` BIGINT,
    `UserAnswer` STRING,
    `FileSetId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN
);

-- Quiz User Answers
-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS `QuizUserAnswers` (
    `AttemptId` BIGINT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `TimeCompleted` TIMESTAMP_NTZ,
    `QuestionNumber` INT,
    `Comment` STRING,
    `SortOrder` INT,
    `Score` DECIMAL(19,9),
    `Page` INT,
    `SectionId` BIGINT,
    `ObjectId` BIGINT,
    `OutOf` DECIMAL(19,9),
    `TimeStarted` TIMESTAMP_NTZ,
    `IsBonus` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `QuizTimeCompleted` TIMESTAMP_NTZ
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ReleaseConditionObjects` (
    `PreRequisiteId` INT,
    `ResultId` INT,
    `OrgUnitId` INT,
    `Name` STRING,
    `IsNegativeCondition` BOOLEAN,
    `PreRequisiteToolId` INT,
    `Id1` INT,
    `Id2` INT,
    `ResultToolId` INT,
    `UsesPercentage` BOOLEAN,
    `OperatorTypeDesc` STRING,
    `Version` BIGINT,
    `Guid1` STRING,
    `Guid2` STRING
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ReleaseConditionResults` (
    `ResultId` INT,
    `UserId` INT,
    `Met` STRING,
    `Version` BIGINT,
    `DeletedDate` TIMESTAMP_NTZ
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ReofferCourse` (
    `CourseOfferingId` INT,
    `SourceCourseId` INT,
    `CreatedBy` INT,
    `ReofferDate` TIMESTAMP_NTZ
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `RoleDetails` (
    `RoleId` INT,
    `RoleName` STRING,
    `Description` STRING,
    `IsCascading` BOOLEAN,
    `InClassList` BOOLEAN,
    `ClassListRoleName` STRING,
    `ClassListShowGroups` BOOLEAN,
    `ClassListShowSections` BOOLEAN,
    `ClassListDisplayRole` BOOLEAN,
    `AccessInactiveCO` BOOLEAN,
    `HasSpecialAccess` BOOLEAN,
    `AddToCourseOfferingGroups` BOOLEAN,
    `CanBeAutoEnrolledIntoGroups` BOOLEAN,
    `AddToCourseOfferingSections` BOOLEAN,
    `CanBeAutoEnrolledIntoSections` BOOLEAN,
    `AccessPastCourses` BOOLEAN,
    `AccessFutureCourses` BOOLEAN,
    `SortOrder` INT,
    `ShowInContent` BOOLEAN,
    `ShowInDiscussionAssess` BOOLEAN,
    `ShowInDiscussionStats` BOOLEAN,
    `ShowInGrades` BOOLEAN,
    `ShowInAttendance` BOOLEAN,
    `AllowSelfEnrollInGroups` BOOLEAN,
    `ShowInRegistration` BOOLEAN,
    `ShowInUserProgress` BOOLEAN,
    `RoleAlias` STRING,
    `RoleCode` STRING,
    `LastModifiedDate` TIMESTAMP_NTZ,
    `DeletedBy` INT
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `RubricAssessment` (
    `RubricId` BIGINT,
    `OrgUnitId` INT,
    `UserId` INT,
    `Score` DECIMAL(36,2),
    `AssessedByUserId` INT,
    `AssessmentDate` TIMESTAMP_NTZ,
    `IsCompleted` BOOLEAN,
    `ActivityType` STRING,
    `ActivityObjectId` BIGINT,
    `DateCreated` TIMESTAMP_NTZ,
    `AssessmentId` BIGINT,
    `LevelAchievedId` BIGINT,
    `ActivityId` BIGINT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Rubric Assessment Criteria
-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricAssessmentCriteria` (
    `AssessmentId` BIGINT,
    `RubricId` BIGINT,
    `Score` DECIMAL(19,9),
    `Feedback` STRING,
    `IsScoreOverridden` BOOLEAN,
    `CriterionId` BIGINT,
    `LevelAchievedId` BIGINT,
    `Version` BIGINT
);

-- Rubric Criteria Levels
-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `RubricCriteriaLevels` (
    `RubricId` BIGINT,
    `CriterionId` BIGINT,
    `Description` STRING,
    `Feedback` STRING,
    `Value` DECIMAL(19,9),
    `LevelId` BIGINT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Rubric Object Criteria
-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricObjectCriteria` (
    `RubricId` BIGINT,
    `CriterionId` BIGINT,
    `Name` STRING,
    `SortOrder` INT,
    `CriteriaGroupId` BIGINT,
    `GroupName` STRING,
    `GroupSortOrder` INT,
    `LevelSetId` BIGINT,
    `IsDeleted` BOOLEAN
);

-- Rubric Object Levels
-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricObjectLevels` (
    `RubricId` BIGINT,
    `LevelId` BIGINT,
    `Name` STRING,
    `Description` STRING,
    `Feedback` STRING,
    `Value` DECIMAL(19,9),
    `RangeStartValue` DECIMAL(19,9),
    `SortOrder` INT,
    `LevelSetId` BIGINT,
    `IsDeleted` BOOLEAN
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `RubricObjects` (
    `RubricId` BIGINT,
    `Name` STRING,
    `RubricStatus` STRING,
    `Description` STRING,
    `RubricType` STRING,
    `ScoringMethods` STRING,
    `IsScoreVisible` BOOLEAN,
    `OrgUnitID` INT,
    `IsShared` BOOLEAN,
    `IsDeleted` BOOLEAN
);

-- Rubrics Edit
-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricsEdit` (
    `AuditLogId` STRING,
    `RubricId` BIGINT,
    `CriterionId` BIGINT,
    `LevelId` BIGINT,
    `ModifiedBy` INT,
    `ModifiedObjectType` INT,
    `CriteriaGroupId` BIGINT,
    `ModifiedDate` TIMESTAMP_NTZ,
    `PreviousValue` STRING,
    `ModifiedValue` STRING,
    `IsLocked` BOOLEAN,
    `Version` INT
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMActivities` (
    `ActivityId` STRING,
    `ScormObjectId` STRING,
    `ParentActivityId` STRING,
    `NumChildren` INT,
    `InternalId` STRING,
    `Title` STRING,
    `CompletionThreshold` FLOAT,
    `PassingScore` FLOAT,
    `PassingScoreUsed` BOOLEAN,
    `ScoreMin` FLOAT,
    `ScoreMax` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMActivityAttempts` (
    `VisitId` STRING,
    `ActivityId` STRING,
    `AttemptNumber` INT,
    `Completion` STRING,
    `Success` STRING,
    `Score` FLOAT,
    `ScoreRaw` FLOAT,
    `TimeSpent` FLOAT,
    `Progress` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMInteractionAttempts` (
    `VisitId` STRING,
    `InteractionId` STRING,
    `AttemptNumber` INT,
    `ActivityId` STRING,
    `Timestamp` TIMESTAMP_NTZ,
    `Response` STRING,
    `Result` STRING,
    `NumericResult` FLOAT,
    `TimeSpent` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS `SCORMInteractionObjectives` (
    `InteractionId` STRING,
    `ObjectiveId` STRING,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS `SCORMInteractions` (
    `InteractionId` STRING,
    `ActivityId` STRING,
    `InternalId` STRING,
    `InteractionType` STRING,
    `Description` STRING,
    `Weighting` FLOAT,
    `CorrectResponses` STRING,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMObjectiveAttempts` (
    `VisitId` STRING,
    `ObjectiveId` STRING,
    `AttemptNumber` INT,
    `Score` FLOAT,
    `ScoreRaw` FLOAT,
    `Success` STRING,
    `Completion` STRING,
    `Progress` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMObjectives` (
    `ObjectiveId` STRING,
    `ScormObjectId` STRING,
    `ObjectiveType` STRING,
    `ActivityId` STRING,
    `InternalId` STRING,
    `IsPrimary` BOOLEAN,
    `Description` STRING,
    `ScoreMin` FLOAT,
    `ScoreMax` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SCORMObjects` (
    `ScormObjectId` STRING,
    `OrgUnitId` INT,
    `ContentObjectId` INT,
    `ContentServiceContentId` STRING,
    `ContentServiceRevisionId` STRING,
    `ContentServiceTopicId` STRING,
    `Title` STRING,
    `Description` STRING,
    `LearningStandard` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SCORMVisits` (
    `VisitId` STRING,
    `ScormObjectId` STRING,
    `UserId` INT,
    `OrgUnitId` INT,
    `FirstAccessDate` TIMESTAMP_NTZ,
    `LastAccessDate` TIMESTAMP_NTZ,
    `CompletedDate` TIMESTAMP_NTZ,
    `Completion` STRING,
    `Success` STRING,
    `Score` FLOAT,
    `TimeSpent` INT,
    `Progress` FLOAT,
    `LastModified` TIMESTAMP_NTZ
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SessionHistory` (
    `SessionId` BIGINT,
    `OrgId` INT,
    `UserId` INT,
    `DateStarted` TIMESTAMP_NTZ,
    `DateEnded` TIMESTAMP_NTZ,
    `LastAccessed` TIMESTAMP_NTZ,
    `TimedOut` BOOLEAN,
    `HistoryID` BIGINT
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SISCourseMergeLog` (
    `BatchId` STRING,
    `JobType` STRING,
    `Status` STRING,
    `OriginalTargetOrgUnitId` BIGINT,
    `OriginalSourceOrgUnitId` BIGINT,
    `SourceSystemId` BIGINT,
    `NumberOfCoursesInBatch` INT,
    `UserId` BIGINT,
    `ErrorType` STRING,
    `Timestamp` TIMESTAMP_NTZ
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SourceCourseDeployHistory` (
    `SourceCourseDeployId` BIGINT,
    `SourceCourseOrgUnitId` INT,
    `TargetCourseOrgUnitId` INT,
    `UserId` INT,
    `Status` STRING,
    `QueuedTime` TIMESTAMP_NTZ,
    `CompletionTime` TIMESTAMP_NTZ
);

-- Survey Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SurveyAttempts` (
    `AttemptId` BIGINT,
    `SurveyId` BIGINT,
    `UserId` INT,
    `OrgUnitId` INT,
    `AttemptNumber` INT,
    `TimeStarted` TIMESTAMP_NTZ,
    `TimeCompleted` TIMESTAMP_NTZ,
    `AttemptedFromOrgUnitId` INT,
    `OldAttemptNumber` INT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- Survey Objects
-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SurveyObjects` (
    `SurveyId` BIGINT,
    `SurveyName` STRING,
    `CategoryId` BIGINT,
    `OrgUnitId` INT,
    `Description` STRING,
    `DescriptionEnabled` BOOLEAN,
    `HasInstantFeedback` BOOLEAN,
    `IsAnonymous` BOOLEAN,
    `IsVisible` BOOLEAN,
    `SubmissionMessage` STRING,
    `Footer` STRING,
    `FooterIsDisplayed` BOOLEAN,
    `StartDate` TIMESTAMP_NTZ,
    `EndDate` TIMESTAMP_NTZ,
    `DisplayInCalendar` BOOLEAN,
    `ResultId` BIGINT,
    `AttemptsAllowed` INT,
    `SortOrder` INT,
    `CreatedBy` INT,
    `IsDeleted` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `Version` BIGINT,
    `CategoryName` STRING
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
CREATE TABLE IF NOT EXISTS `SurveyUserAnswerResponses` (
    `AttemptId` BIGINT,
    `AttemptNumber` INT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `AnswerId` BIGINT,
    `SortOrder` BIGINT,
    `IsCorrect` BOOLEAN,
    `UserSelection` BIGINT,
    `UserAnswer` STRING,
    `FileSetId` BIGINT,
    `LastModified` TIMESTAMP_NTZ,
    `IsDeleted` BOOLEAN
);

-- Survey User Answers
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `SurveyUserAnswers` (
    `AttemptId` BIGINT,
    `QuestionId` BIGINT,
    `QuestionVersionId` BIGINT,
    `TimeCompleted` TIMESTAMP_NTZ,
    `QuestionNumber` INT,
    `Comment` STRING,
    `SortOrder` INT,
    `Score` DECIMAL(19,9),
    `Page` INT,
    `Assigned` BOOLEAN,
    `IsDeleted` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `LastModifiedBy` INT,
    `SurveyTimeCompleted` TIMESTAMP_NTZ
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SystemAccessLog` (
    `SessionId` STRING,
    `UserId` INT,
    `Timestamp` TIMESTAMP_NTZ,
    `State` STRING,
    `Source` STRING,
    `AppVersion` STRING,
    `Device` STRING,
    `IsOfflineMode` BOOLEAN,
    `IPAddress` STRING
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SystemAccessSummary` (
    `UserId` INT,
    `ImpersonatingUserId` INT,
    `LastSystemAccess` TIMESTAMP_NTZ,
    `Source` STRING
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `Tools` (
    `ToolId` INT,
    `Name` STRING,
    `DisplayName` STRING,
    `Version` BIGINT
);

-- TurnItIn Submissions
-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS `TurnItInSubmissions` (
    `DropboxId` BIGINT,
    `SubmissionId` BIGINT,
    `FileId` BIGINT,
    `LastSubmissionDate` TIMESTAMP_NTZ,
    `SubmissionStatus` SMALLINT,
    `SubmissionErrorType` SMALLINT,
    `ErrorMessage` STRING,
    `SubmittedBy` INT,
    `LastRefreshDate` TIMESTAMP_NTZ,
    `LastModified` TIMESTAMP_NTZ
);

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserAttributeDefinitions` (
    `AttributeId` STRING,
    `Name` STRING,
    `Type` STRING,
    `AllowMultiple` BOOLEAN,
    `IsDefault` BOOLEAN,
    `LastModified` TIMESTAMP_NTZ,
    `ModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `Version` BIGINT
);

-- User Attribute Values
-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
    `UserId` INT,
    `AttributeId` STRING,
    `Value` STRING,
    `LastModified` TIMESTAMP_NTZ,
    `ModifiedBy` INT,
    `IsDeleted` BOOLEAN,
    `Version` INT
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserEnrollments` (
    `OrgUnitId` INT,
    `UserId` INT,
    `RoleName` STRING,
    `EnrollmentDate` TIMESTAMP_NTZ,
    `EnrollmentType` STRING,
    `RoleId` INT
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserLogins` (
    `UserId` INT,
    `UserName` STRING,
    `IP` STRING,
    `SessionId` INT,
    `StatusType` STRING,
    `AttemptDate` TIMESTAMP_NTZ,
    `ImpersonatingUserId` INT,
    `LoginAttemptId` STRING,
    `LoginSource` STRING
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `Users` (
    `UserId` INT,
    `UserName` STRING,
    `OrgDefinedId` STRING,
    `FirstName` STRING,
    `MiddleName` STRING,
    `LastName` STRING,
    `IsActive` BOOLEAN,
    `ExternalEmail` STRING,
    `CreationDate` TIMESTAMP_NTZ,
    `Version` BIGINT,
    `OrgRoleId` INT,
    `DateDeleted` TIMESTAMP_NTZ
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `VirtualClassroomUsage` (
    `OrgUnitId` INT,
    `CourseName` STRING,
    `MeetingId` STRING,
    `MeetingName` STRING,
    `CreationUserId` INT,
    `CreationDate` TIMESTAMP_NTZ,
    `ScheduledDate` TIMESTAMP_NTZ,
    `ScheduledDuration` INT,
    `IsPublished` BOOLEAN,
    `ExternalLinksEnabled` BOOLEAN,
    `WholeClassInvited` BOOLEAN,
    `IsCancelled` BOOLEAN,
    `StartDateTime` TIMESTAMP_NTZ,
    `EndDateTime` TIMESTAMP_NTZ,
    `IsRecorded` BOOLEAN
);
