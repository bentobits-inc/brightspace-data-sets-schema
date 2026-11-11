-- All 144 Brightspace Data Sets tables for BigQuery (current).
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Accommodations Profile Log
-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AccommodationsProfileLog` (
    `AccommodatedUserId` INT64,
    `OrgUnitId` INT64,
    `QuizTimeLimitMultiplier` NUMERIC(5,2),
    `QuizTimeLimitExtraTime` INT64,
    `QuizControlAlwaysAllowRightClick` BOOL,
    `ModifiedBy` INT64,
    `LastModified` DATETIME
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityExemptionsLog` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `ObjectId` INT64,
    `ActivityId` STRING(225),
    `LogTypeName` STRING(50),
    `LastModifiedUtc` DATETIME,
    `LastModifiedBy` INT64,
    `ActivityExemptionsLogId` INT64,
    `ToolId` INT64
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityFeedCommentLog` (
    `LogId` STRING(36),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `CommentId` STRING(36),
    `Action` STRING(16),
    `ActionDate` DATETIME,
    `Content` STRING(3072),
    `PostId` STRING(36)
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS `ActivityFeedCommentObjects` (
    `OrgUnitId` INT64,
    `CommentId` STRING(36),
    `LastModifiedBy` INT64,
    `LastModified` DATETIME,
    `Content` STRING(3072),
    `IsDeleted` BOOL,
    `PostId` STRING(36),
    `Version` INT64
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ActivityFeedPostLog` (
    `LogId` STRING(36),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `PostId` STRING(36),
    `PostType` STRING(16),
    `Action` STRING(16),
    `ActionDate` DATETIME,
    `DropboxId` INT64,
    `Content` STRING(3072),
    `CommentCount` INT64,
    `AttachmentCount` INT64
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ActivityFeedPostObjects` (
    `OrgUnitId` INT64,
    `PostId` STRING(36),
    `PostType` STRING(16),
    `LastModifiedBy` INT64,
    `LastModified` DATETIME,
    `DropboxId` INT64,
    `Content` STRING(3072),
    `IsDeleted` BOOL,
    `CommentCount` INT64,
    `AttachmentCount` INT64,
    `Version` INT64
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AIConsumption` (
    `ConsumptionId` STRING(255),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `Date` DATETIME,
    `GenerationCount` INT64,
    `ConsumptionSource` INT64
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `Announcements` (
    `AnnouncementId` INT64,
    `OrgUnitId` INT64,
    `Title` STRING(400),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsGlobal` BOOL,
    `IsDraft` BOOL,
    `NumAttachments` INT64,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `CreatedBy` INT64,
    `IsAuthorInfoShown` BOOL,
    `CreatedDate` DATETIME,
    `ResultId` INT64
);

-- Assignment Special Access
-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `AssignmentSpecialAccess` (
    `DropboxId` INT64,
    `UserId` INT64,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `ModifiedBy` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL,
    `StartDateAvailabilityType` INT64,
    `EndDateAvailabilityType` INT64
);

-- Assignment Submission Details
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

-- Assignment Submissions
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

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AssignmentSummary` (
    `DropboxId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(128),
    `Category` STRING(128),
    `Type` STRING(10),
    `GradeItemId` INT64,
    `PossibleScore` NUMERIC(19,9),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `IsRestricted` BOOL,
    `IsDeleted` BOOL,
    `TurnItInEnabled` BOOL,
    `IsHidden` BOOL,
    `SortOrder` INT64,
    `SubmissionType` STRING(18),
    `CompletionType` STRING(27),
    `ResultId` INT64,
    `CategoryId` INT64,
    `Version` INT64,
    `StartDateAvailabilityType` INT64,
    `EndDateAvailabilityType` INT64,
    `AIUtilization` INT64,
    `Instructions` STRING(10000)
);

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceRegisters` (
    `AttendanceRegisterId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(128),
    `Description` STRING(1000),
    `SchemeId` INT64,
    `IsVisible` BOOL,
    `IncludeAllUsers` BOOL,
    `CauseForConcern` NUMERIC(19,9),
    `Version` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AttendanceSchemes` (
    `SchemeId` INT64,
    `OrgUnitId` INT64,
    `SchemeName` STRING(128),
    `SchemeSymbolId` INT64,
    `SymbolName` STRING(128),
    `SymbolValue` STRING(50),
    `Percentage` NUMERIC(19,9),
    `Version` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
CREATE TABLE IF NOT EXISTS `AttendanceSessions` (
    `AttendanceSessionId` INT64,
    `AttendanceRegisterId` INT64,
    `Name` STRING(128),
    `Description` STRING(256),
    `SortOrder` INT64,
    `Version` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS `AttendanceUserSessions` (
    `UserId` INT64,
    `AttendanceSessionId` INT64,
    `SchemeSymbolId` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS `AudioVideoProcessed` (
    `ContentId` STRING(36),
    `RevisionId` STRING(36),
    `RevisionNumber` INT64,
    `Type` STRING(5),
    `Source` STRING(32),
    `RevisionSize` INT64,
    `Duration` INT64,
    `RequiredTranscoding` BOOL,
    `RequiredTranscribing` BOOL,
    `LastModified` DATETIME
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `AuditorRelationshipsLog` (
    `AuditorId` INT64,
    `UserToAuditId` INT64,
    `OrgUnitId` INT64,
    `Action` STRING(16),
    `ModifiedBy` INT64,
    `ModifiedDate` DATETIME
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `AwardObjects` (
    `AwardId` INT64,
    `Name` STRING(256),
    `AwardTypeId` INT64,
    `Type` STRING(128),
    `Description` STRING(512),
    `ExpiryCalculationType` STRING(128),
    `ExpiryNotificationType` STRING(128),
    `ExpiryDate` DATETIME,
    `ImagePath` STRING(1000),
    `CreatedByUserId` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL,
    `Criteria` STRING(1000)
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
    `AwardId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `IssuedBy` INT64,
    `IssueDate` DATETIME,
    `ExpiryDate` DATETIME,
    `IssuedId` INT64,
    `Criteria` STRING(1000),
    `Evidence` STRING(1000),
    `RevokedDate` DATETIME,
    `RevokedReason` STRING(1000),
    `RevokedBy` INT64,
    `LastModifiedBy` INT64,
    `LastModifiedDate` DATETIME,
    `Version` INT64,
    `CertificateId` STRING(12)
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `BrightspaceEmailLog` (
    `MailId` INT64,
    `SenderUserId` INT64,
    `SenderAddress` STRING(256),
    `RecipientAddress` STRING(256),
    `RecipientType` STRING(4),
    `DateTimeSent` DATETIME,
    `Subject` STRING(1000)
);

-- Calendar Events
-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CalendarEvents` (
    `ScheduleId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `Title` STRING(256),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `TimeZoneIdentifier` STRING(256),
    `IsAllDayEvent` BOOL,
    `RecurrenceType` STRING(7),
    `RecurrenceInterval` INT64,
    `CreatedByUserId` INT64,
    `LastModified` DATETIME,
    `EventObjectTypeName` STRING(200),
    `ObjectLookupId1` INT64,
    `ObjectLookupId2` INT64
);

-- Checklist Category Details
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistCategoryDetails` (
    `CategoryId` INT64,
    `ChecklistId` INT64,
    `Name` STRING(512),
    `Description` STRING(1000),
    `DescriptionIsHtml` BOOL,
    `SortOrder` INT64,
    `LastModifiedUtc` DATETIME,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64,
    `Version` INT64
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistCompletions` (
    `UserId` INT64,
    `DateCompleted` DATETIME,
    `ItemId` INT64,
    `LastModified` DATETIME,
    `IsCompleted` BOOL,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64,
    `Version` INT64
);

-- Checklist Item Details
-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ChecklistItemDetails` (
    `ItemId` INT64,
    `CategoryId` INT64,
    `Name` STRING(512),
    `Description` STRING(1000),
    `DescriptionIsHtml` BOOL,
    `DueDate` DATETIME,
    `ScheduleId` INT64,
    `SortOrder` INT64,
    `IsAutoChecked` BOOL,
    `LastModifiedUtc` DATETIME,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64,
    `Version` INT64
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ChecklistObjects` (
    `ChecklistId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(512),
    `Description` STRING(1000),
    `DescriptionIsHtml` BOOL,
    `SharedUserId` INT64,
    `DisplayInNewWindow` BOOL,
    `SortOrder` INT64,
    `Version` INT64,
    `ResultId` INT64,
    `DateDeleted` DATETIME,
    `DeletedBy` INT64
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyActivities` (
    `ActivityId` INT64,
    `OrgUnitId` INT64,
    `ActivityName` STRING(256),
    `ActivityTypeId` INT64,
    `AssessmentType` STRING(7),
    `ObjectLookupId` INT64,
    `RubricId` INT64,
    `LevelId` INT64,
    `RubricCriterionId` INT64,
    `AssessmentThresholdCriteria` STRING(2),
    `AssessmentThreshold` NUMERIC(19,9),
    `IsAutoEval` BOOL,
    `RubricName` STRING(256),
    `RubricLevelRequired` STRING(256),
    `ObjectId` INT64,
    `ActivityType` STRING(50),
    `Version` INT64
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `CompetencyActivityLog` (
    `ActivityId` INT64,
    `ActivityLogId` INT64,
    `LogTypeId` INT64,
    `LogTypeName` STRING(19),
    `LogDateTime` DATETIME,
    `ModifiedBy` INT64
);

-- Competency Activity Results
-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CompetencyActivityResults` (
    `ActivityId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `LearningObjectId` INT64,
    `IsAchieved` BOOL,
    `PercentAchieved` NUMERIC(19,9),
    `RubricScore` NUMERIC(19,9),
    `RubricLevelAchieved` STRING(256),
    `RubricId` INT64,
    `RubricCriterionId` INT64,
    `AchievedDate` DATETIME,
    `Version` INT64
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS `CompetencyLog` (
    `CompetencyLogId` INT64,
    `LogTypeId` INT64,
    `LogTypeName` STRING(19),
    `ObjectId` INT64,
    `ObjectTypeId` INT64,
    `ObjectTypeName` STRING(18),
    `ObjectVersion` INT64,
    `LogDateTime` DATETIME,
    `ModifiedBy` INT64,
    `IndirectObjectId` INT64,
    `IndirectObjectTypeName` STRING(18),
    `IndirectObjectTypeId` INT64,
    `IndirectObjectVersion` INT64
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyObjects` (
    `ObjectId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(256),
    `Type` STRING(256),
    `ReadyForEvaluation` BOOL,
    `Status` STRING(9),
    `Description` STRING(1000),
    `NeedReevaluation` BOOL,
    `ReevaluationIfAchieved` BOOL,
    `ReevaluationIfNotAchieved` BOOL,
    `AdditionalIdentifier` STRING(512),
    `IsHidden` BOOL
);

-- Competency Structure
-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS `CompetencyStructure` (
    `ObjectId` INT64,
    `ParentObjectId` INT64,
    `BaseObjectID` INT64,
    `Depth` INT64,
    `EntryTime` INT64
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ContentFilesPropertiesLog` (
    `OrgUnitId` INT64,
    `ContentObjectId` INT64,
    `Action` STRING(10),
    `FilePath` STRING(10000),
    `FileName` STRING(512),
    `FileExtension` STRING(512),
    `FileSizeBytes` INT64,
    `UploadDate` DATETIME,
    `LastModifiedBy` INT64,
    `LastModified` DATETIME
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS `ContentObjects` (
    `ContentObjectId` INT64,
    `OrgUnitId` INT64,
    `Title` STRING(150),
    `ContentObjectType` STRING(6),
    `CompletionType` STRING(7),
    `ParentContentObjectId` INT64,
    `Location` STRING(1024),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `ObjectId1` INT64,
    `ObjectId2` INT64,
    `ObjectId3` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL,
    `SortOrder` INT64,
    `Depth` INT64,
    `ToolId` INT64,
    `IsHidden` BOOL,
    `ResultId` INT64,
    `DeletedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedBy` INT64,
    `DeletedBy` INT64,
    `AIUtilization` INT64,
    `Version` INT64
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ContentUserCompletion` (
    `ContentObjectId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `DateCompleted` DATETIME,
    `LastModified` DATETIME,
    `Version` INT64,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `AutomaticDateCompleted` DATETIME,
    `ManualDateCompleted` DATETIME
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ContentUserProgress` (
    `ContentObjectId` INT64,
    `UserId` INT64,
    `CompletedDate` DATETIME,
    `LastVisited` DATETIME,
    `IsRead` BOOL,
    `NumRealVisits` INT64,
    `NumFakeVisits` INT64,
    `TotalTime` INT64,
    `IsVisited` BOOL,
    `IsCurrentBookmark` BOOL,
    `IsSelfAssessComplete` BOOL,
    `LastModified` DATETIME,
    `Version` INT64
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseAccess` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `DayAccessed` DATETIME
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseAccessLog` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `Timestamp` DATETIME,
    `Source` STRING(20)
);

-- Course Awards
-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CourseAwards` (
    `AssociationId` INT64,
    `AwardId` INT64,
    `OrgUnitId` INT64,
    `DateCreated` DATETIME,
    `HiddenAward` BOOL,
    `ConditionSetId` INT64,
    `LastModified` DATETIME,
    `Credits` NUMERIC(9,2),
    `IsAssociated` BOOL,
    `Version` INT64
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CourseCopyLogs` (
    `SourceOrgUnitId` INT64,
    `DestinationOrgUnitId` INT64,
    `UserId` INT64,
    `Status` STRING(128),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsDestinationNew` BOOL,
    `CopyProtectedResources` BOOL,
    `CopyCourseJobId` INT64,
    `StatusId` INT64
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CoursePublisherLaunches` (
    `LaunchId` STRING(36),
    `OrgUnitId` INT64,
    `RecipientId` STRING(36),
    `UserId` INT64,
    `RoleId` INT64,
    `LaunchMethod` STRING(256),
    `ExternalUserId` STRING(256),
    `ExternalLMSType` STRING(256),
    `IsNewUser` BOOL,
    `LastModified` DATETIME
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CoursePublisherRecipients` (
    `RecipientID` STRING(36),
    `Name` STRING(256),
    `CreatedAt` DATETIME,
    `LastModified` DATETIME
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDCategories` (
    `CategoryId` INT64,
    `Name` STRING(256),
    `LastModified` DATETIME,
    `DateDeleted` DATETIME,
    `Version` INT64
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS `CPDJobTargets` (
    `PrincipalId` INT64,
    `CategoryId` INT64,
    `JobTitle` STRING(256),
    `StructuredMinutes` INT64,
    `UnstructuredMinutes` INT64,
    `StructuredRecordCount` INT64,
    `UnstructuredRecordCount` INT64,
    `StartDate` DATETIME,
    `DateDeleted` DATETIME,
    `LastModified` DATETIME,
    `Version` INT64
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDMethods` (
    `MethodId` INT64,
    `Name` STRING(4000),
    `LastModified` DATETIME,
    `DateDeleted` DATETIME,
    `Version` INT64
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDQuestionAnswers` (
    `AnswerId` INT64,
    `AnswerText` STRING(4000),
    `QuestionId` INT64,
    `RecordId` INT64,
    `UserId` INT64,
    `Action` STRING(16),
    `LastModified` DATETIME,
    `DateDeleted` DATETIME,
    `Version` INT64
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `CPDQuestions` (
    `QuestionId` INT64,
    `QuestionText` STRING(4000),
    `LastModified` DATETIME,
    `DateDeleted` DATETIME,
    `Version` INT64
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDUserRecords` (
    `RecordId` INT64,
    `RecordName` STRING(256),
    `State` STRING(50),
    `UserId` INT64,
    `Category` INT64,
    `Method` INT64,
    `CreditMinutes` INT64,
    `Evidence` STRING(4000),
    `Type` STRING(50),
    `Grade` NUMERIC(4,3),
    `DateCompleted` DATETIME,
    `LastModified` DATETIME,
    `DateDeleted` DATETIME,
    `Version` INT64
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CPDUserTargets` (
    `PrincipalId` INT64,
    `CategoryId` INT64,
    `UserId` INT64,
    `StructuredMinutes` INT64,
    `UnstructuredMinutes` INT64,
    `StructuredRecordCount` INT64,
    `UnstructuredRecordCount` INT64,
    `StartDate` DATETIME,
    `DateDeleted` DATETIME,
    `LastModified` DATETIME,
    `Version` INT64
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CreatorPracticesAdoption` (
    `ActivityInstanceId` INT64,
    `CreatedById` INT64,
    `OrgUnitId` INT64,
    `PracticeType` STRING(32),
    `PracticeTitle` STRING(255),
    `ProviderObjectId` INT64,
    `CreatedDate` DATETIME,
    `Version` INT64
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `CreatorPracticesEngagement` (
    `PracticeEngagementId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `CompletionStatus` STRING(10),
    `ActivityInstanceId` INT64,
    `CompletionDate` DATETIME,
    `Version` INT64
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionForums` (
    `OrgUnitId` INT64,
    `ForumId` INT64,
    `Name` STRING(400),
    `Description` STRING(1000),
    `MustPostToParticipate` BOOL,
    `AllowAnon` BOOL,
    `IsHidden` BOOL,
    `RequiresApproval` BOOL,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `ResultId` INT64,
    `StartDate` DATETIME,
    `StartDateAvailabilityType` INT64,
    `EndDate` DATETIME,
    `EndDateAvailabilityType` INT64,
    `Version` INT64
);

-- Discussion Posts
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionPosts` (
    `OrgUnitId` INT64,
    `TopicId` INT64,
    `UserId` INT64,
    `PostId` INT64,
    `ThreadId` INT64,
    `IsReply` BOOL,
    `ParentPostId` INT64,
    `NumReplies` INT64,
    `DatePosted` DATETIME,
    `IsDeleted` BOOL,
    `RatingSum` INT64,
    `NumRatings` INT64,
    `Score` NUMERIC(19,9),
    `LastEditDate` DATETIME,
    `SortOrder` INT64,
    `Depth` INT64,
    `Thread` STRING(400),
    `WordCount` INT64,
    `AttachmentCount` INT64,
    `Version` INT64
);

-- Discussion Posts Read Status
-- Primary key (informational, not enforced): UserId, PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): PostId -> DiscussionPosts.PostId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionPostsReadStatus` (
    `TopicId` INT64,
    `UserId` INT64,
    `PostId` INT64,
    `IsRead` BOOL,
    `FirstReadDate` DATETIME,
    `LastReadDate` DATETIME,
    `Version` INT64
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `DiscussionTopicUserScores` (
    `UserId` INT64,
    `TopicId` INT64,
    `Score` NUMERIC(19,9),
    `IsGraded` BOOL,
    `Version` INT64,
    `IsDeleted` BOOL
);

-- Discussion Topics
-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `DiscussionTopics` (
    `OrgUnitId` INT64,
    `TopicId` INT64,
    `ForumId` INT64,
    `Name` STRING(1000),
    `Description` STRING(1000),
    `MustPostToParticipate` BOOL,
    `AllowAnon` BOOL,
    `IsHidden` BOOL,
    `RequiresApproval` BOOL,
    `LastPostDate` DATETIME,
    `LastPostUserId` INT64,
    `NumViews` INT64,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `GradeItemId` INT64,
    `ScoreOutOf` FLOAT64,
    `ScoreCalculationMethod` STRING(19),
    `IncludeNonScoredValues` BOOL,
    `Version` INT64,
    `ResultId` INT64,
    `StartDate` DATETIME,
    `StartDateAvailabilityType` INT64,
    `EndDate` DATETIME,
    `EndDateAvailabilityType` INT64,
    `AIUtilization` INT64,
    `DueDate` DATETIME
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `EnrollmentsAndWithdrawals` (
    `LogId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `RoleId` INT64,
    `Action` STRING(50),
    `ModifiedByUserId` INT64,
    `EnrollmentDate` DATETIME
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeBookSettings` (
    `OrgUnitId` INT64,
    `GradeSchemeId` INT64,
    `GradingSystem` STRING(8),
    `UngradedItems` STRING(25),
    `IsAdjustedFinalGradeReleased` BOOL,
    `IsCalculatedFinalGradeReleased` BOOL,
    `LastModified` DATETIME
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeObjects` (
    `GradeObjectId` INT64,
    `OrgUnitId` INT64,
    `ParentGradeObjectId` INT64,
    `Name` STRING(128),
    `TypeName` STRING(50),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsAutoPointed` BOOL,
    `IsFormula` BOOL,
    `IsBonus` BOOL,
    `MaxPoints` NUMERIC(19,9),
    `CanExceedMaxGrade` BOOL,
    `ExcludeFromFinalGradeCalc` BOOL,
    `GradeSchemeId` INT64,
    `Weight` NUMERIC(19,9),
    `NumLowestGradesToDrop` INT64,
    `NumHighestGradesToDrop` INT64,
    `WeightDistributionType` STRING(8),
    `CreatedDate` DATETIME,
    `ToolName` STRING(50),
    `AssociatedToolItemId` INT64,
    `LastModified` DATETIME,
    `ShortName` STRING(128),
    `GradeObjectTypeId` INT64,
    `SortOrder` INT64,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `DeletedByUserId` INT64,
    `ResultId` INT64,
    `ToolId` INT64,
    `Version` INT64
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeObjectsLog` (
    `LogId` INT64,
    `Name` STRING(50),
    `GradeObjectId` INT64,
    `UserId` INT64,
    `GradeSymbolString` STRING(50),
    `PointsDenominator` NUMERIC(19,9),
    `PointsNumerator` NUMERIC(19,9),
    `WeightedDenominator` NUMERIC(19,9),
    `WeightedNumerator` NUMERIC(19,9),
    `Modified` DATETIME,
    `ModifiedBy` INT64
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `GradeResults` (
    `GradeObjectId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `PointsNumerator` NUMERIC(19,9),
    `PointsDenominator` NUMERIC(19,9),
    `WeightedNumerator` NUMERIC(19,9),
    `WeightedDenominator` NUMERIC(19,9),
    `IsReleased` BOOL,
    `IsDropped` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Comments` STRING(1000),
    `PrivateComments` STRING(1000),
    `GradeText` STRING(50),
    `GradeReleasedDate` DATETIME,
    `Version` INT64,
    `IsDeleted` BOOL
);

-- Grade Scheme Ranges
-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS `GradeSchemeRanges` (
    `GradeSchemeRangeId` INT64,
    `GradeSchemeId` INT64,
    `SymbolString` STRING(100),
    `AssignedValue` NUMERIC(19,9),
    `RangeStart` NUMERIC(19,9),
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `GradeSchemes` (
    `GradeSchemeId` INT64,
    `OrgUnitId` INT64,
    `SchemeName` STRING(128),
    `DeletedDate` DATETIME,
    `Version` INT64
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `IntelligentAgentObjects` (
    `AgentId` INT64,
    `OrgUnitId` INT64,
    `AgentName` STRING(128),
    `Description` STRING(1000),
    `Enabled` BOOL,
    `SpecificRoles` STRING(1000),
    `LoginConditionEnabled` BOOL,
    `LoginConditionThreshold` INT64,
    `LoginConditionType` STRING(14),
    `AccessConditionEnabled` BOOL,
    `AccessConditionThreshold` INT64,
    `AccessConditionType` STRING(20),
    `ResultId` INT64,
    `RepeatType` STRING(10),
    `EmailWhenSatisfied` BOOL,
    `EnableSchedule` BOOL,
    `ScheduleType` STRING(10),
    `ScheduleRepeatsEvery` INT64,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Intelligent Agent Run Log
-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunLog` (
    `AgentId` INT64,
    `AgentRunId` INT64,
    `IsPracticeRun` BOOL,
    `IsRunNow` BOOL,
    `NumUsers` INT64,
    `NumUsersWithErrors` INT64,
    `NumUsersWithInfos` INT64,
    `NumUsersWithWarnings` INT64,
    `RunUserId` INT64,
    `RunDate` DATETIME
);

-- Intelligent Agent Run Users
-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunUsers` (
    `AgentId` INT64,
    `AgentRunId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `ActionTypeName` STRING(50),
    `ActionHasError` BOOL,
    `ActionHasInfo` BOOL,
    `ActionHasWarning` BOOL,
    `ShouldRetry` BOOL
);

-- JIT Provisioned Users Log
-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `JITProvisionedUsersLog` (
    `UserId` INT64,
    `MappingField` STRING(32),
    `MappingFieldValue` STRING(270),
    `ProviderType` STRING(32),
    `ProviderId` STRING(1024),
    `RoleId` INT64,
    `Timestamp` DATETIME,
    `Action` STRING(16)
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LocalAuthenticationSecurityLog` (
    `UserId` INT64,
    `Action` STRING(70),
    `ModifiedBy` INT64,
    `ModifiedDate` DATETIME
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageDeploymentAudit` (
    `Action` STRING(10),
    `DeploymentID` STRING(36),
    `ClientID` STRING(36),
    `DeploymentName` STRING(200),
    `IsDeploymentEnabled` BOOL,
    `HasAssignmentsAndGrades` BOOL,
    `HasDeepLinking` BOOL,
    `HasNamesAndRoles` BOOL,
    `HasSubmissionReview` BOOL,
    `HasActivityItemProfile` BOOL,
    `HasPlatformNotificationService` BOOL,
    `HasContextCopy` BOOL,
    `ModifiedBy` INT64,
    `Anonymous` BOOL,
    `PreProvisioningEnabled` BOOL,
    `SendOrgUnitInfo` BOOL,
    `SendUserFirstName` BOOL,
    `SendUserMiddleName` BOOL,
    `SendUserLastName` BOOL,
    `SendUserEmail` BOOL,
    `SendBrightspaceUserID` BOOL,
    `SendBrightspaceUsername` BOOL,
    `SendBrightspaceOrgDefinedId` BOOL,
    `SendLinkTitle` BOOL,
    `SendLinkDescription` BOOL,
    `OpenAsExternal` BOOL,
    `AutoMigrateLinks` BOOL,
    `IsSharedToManyOrgUnits` BOOL,
    `AutoCreateGrades` BOOL,
    `IncludeInFinalGrade` BOOL,
    `Timestamp` DATETIME,
    `HasAssetProcessor` BOOL
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTIAdvantageRegistrationAudit` (
    `Action` STRING(10),
    `ClientId` STRING(255),
    `ToolName` STRING(200),
    `Domain` STRING(2083),
    `RedirectURLs` STRING(2083),
    `KeysetURL` STRING(255),
    `LoginURL` STRING(255),
    `LTIVersion` STRING(12),
    `IsRegistrationEnabled` BOOL,
    `SendInstitutionRole` BOOL,
    `TargetLinkURI` STRING(255),
    `ModifiedBy` INT64,
    `HasAssignmentAndGradeServices` BOOL,
    `HasSubmissionReview` BOOL,
    `HasDeepLinking` BOOL,
    `HasNamesAndRoleProvisioningServices` BOOL,
    `HasActivityItemProfile` BOOL,
    `HasPlatformNotificationService` BOOL,
    `Timestamp` DATETIME,
    `HasAssetProcessor` BOOL
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS `LTILaunches` (
    `LTILaunchId` STRING(36),
    `UserId` INT64,
    `IMSRoleNames` STRING(10000),
    `ImpersonatingUserId` INT64,
    `ImpersonatingUserIMSRoleNames` STRING(10000),
    `LaunchDate` DATETIME,
    `OrgUnitId` INT64,
    `LTILinkId` INT64,
    `DeploymentId` STRING(36),
    `ClientId` STRING(36),
    `ToolProviderId` STRING(300),
    `ContentTopicId` INT64,
    `ParentModuleId` INT64,
    `Placement` STRING(10),
    `MessageVersion` STRING(10),
    `RequestType` STRING(30)
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `LTILinkMigrationAudit` (
    `LTIMigrationId` STRING(36),
    `UserId` INT64,
    `MigrationDate` DATETIME,
    `OrgUnitId` INT64,
    `LinkId` INT64,
    `LinkURL` STRING(2000),
    `LinkName` STRING(200),
    `ClientId` STRING(255),
    `RegistrationDomain` STRING(2083),
    `DeploymentId` STRING(36),
    `JobId` INT64,
    `Status` INT64,
    `FailureCode` INT64,
    `MigrationType` INT64,
    `LegacyURL` STRING(2083)
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `LTILinks` (
    `LtiLinkId` INT64,
    `OrgUnitId` INT64,
    `Title` STRING(200),
    `LinkType` INT64,
    `LTIVersion` STRING(12),
    `Url` STRING(2000),
    `Description` STRING(1000),
    `IsVisible` BOOL,
    `SendTCInfo` BOOL,
    `SendContextInfo` BOOL,
    `SendCourseInfo` BOOL,
    `SendOrgUnitInfo` BOOL,
    `SendUserId` BOOL,
    `SendUserName` BOOL,
    `SendUserEmail` BOOL,
    `SendLinkTitle` BOOL,
    `SendLinkDescription` BOOL,
    `SendD2LUserName` BOOL,
    `SendD2LOrgDefinedId` BOOL,
    `SendD2LOrgRoleId` BOOL,
    `SendBrightspaceUserId` BOOL,
    `Anonymous` BOOL,
    `Shared` BOOL,
    `UseToolProviderSecuritySettings` BOOL,
    `LastModifiedDate` DATETIME,
    `OuAvailabilitySetId` INT64,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `CreatedDate` DATETIME,
    `DeploymentId` STRING(36),
    `LinkSubType` INT64
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `MediaConsumptionLog` (
    `LogId` STRING(36),
    `UserId` INT64,
    `ContentId` STRING(36),
    `RevisionId` STRING(36),
    `ContentType` STRING(5),
    `ClientApp` STRING(32),
    `DateConsumed` DATETIME,
    `DurationPercentageWatched` INT64
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `MediaObjects` (
    `ContentId` STRING(36),
    `Title` STRING(1000),
    `RevisionCount` INT64,
    `OwnerId` INT64,
    `LastModified` DATETIME
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitAncestors` (
    `OrgUnitId` INT64,
    `AncestorOrgUnitId` INT64,
    `LastModified` DATETIME,
    `DateDeleted` DATETIME
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitDescendants` (
    `OrgUnitId` INT64,
    `DescendantOrgUnitId` INT64,
    `LastModified` DATETIME,
    `DateDeleted` DATETIME
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitParents` (
    `OrgUnitId` INT64,
    `ParentOrgUnitId` INT64,
    `RowVersion` INT64,
    `DateDeleted` DATETIME
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `OrganizationalUnitRecentAccess` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `LastAccessedDate` DATETIME
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `OrganizationalUnits` (
    `OrgUnitId` INT64,
    `Organization` STRING(50),
    `Type` STRING(50),
    `Name` STRING(128),
    `Code` STRING(50),
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `IsActive` BOOL,
    `CreatedDate` DATETIME,
    `IsDeleted` BOOL,
    `DeletedDate` DATETIME,
    `RecycledDate` DATETIME,
    `Version` INT64,
    `OrgUnitTypeId` INT64
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomeDetails` (
    `OutcomeId` STRING(36),
    `OutcomeDefinitionSource` STRING(1000),
    `OutcomeDefinitionId` STRING(128),
    `ParentOutcomeId` STRING(36),
    `Description` STRING(1000),
    `Notation` STRING(1000),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesAlignedToToolObjects` (
    `ObjectType` INT64,
    `ObjectId` STRING(255),
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `AIUtilization` INT64
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS `OutcomesAssessedCheckpoints` (
    `CheckpointId` STRING(36),
    `DemonstrationId` STRING(36),
    `Feedback` STRING(1000),
    `ConfigDecayRate` INT64,
    `ConfigAggregationMethod` INT64,
    `ConfigIncludedActivities` INT64,
    `ConfigMultipleAttemptStrategy` INT64,
    `ConfigRecentlyAssessedActivityCount` INT64,
    `ConfigTieBreaker` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `HasMetAchievementThreshold` BOOL,
    `AchievedLevelId` STRING(36)
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesCourseSpecificScales` (
    `OrgUnitId` INT64,
    `RegistryId` STRING(36),
    `ScaleId` STRING(36),
    `AchievementThreshold` STRING(36),
    `CreatedDate` DATETIME,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesDemonstrations` (
    `DemonstrationId` STRING(36),
    `ExplicitlyEnteredScaleLevelId` STRING(36),
    `AutomaticallyGeneratedScaleLevelId` STRING(36),
    `AlignedObjectType` INT64,
    `AlignedObjectId` STRING(1000),
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `IsPublished` BOOL,
    `AssessedUserId` INT64,
    `AssessedDate` DATETIME,
    `AssessorUserId` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
CREATE TABLE IF NOT EXISTS `OutcomesInRegistries` (
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Outcomes Rubric Alignments
-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
CREATE TABLE IF NOT EXISTS `OutcomesRubricAlignments` (
    `RubricId` INT64,
    `CriterionId` INT64,
    `OutcomeId` STRING(36),
    `RegistryId` STRING(36),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `OutcomesScaleDefinition` (
    `ScaleId` STRING(36),
    `Name` STRING(1000),
    `IsDefault` BOOL,
    `UsePercentages` BOOL,
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `AchievementThreshold` STRING(36)
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesScaleLevelDefinition` (
    `ScaleLevelId` STRING(36),
    `ScaleId` STRING(36),
    `Name` STRING(1000),
    `SortOrder` INT64,
    `PercentageRangeStart` INT64,
    `RGB` STRING(40),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesSetCourse` (
    `RegistryId` STRING(36),
    `OrgUnitId` INT64,
    `SourceOutcomeSetId` INT64,
    `IsPrimary` BOOL,
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `ScaleId` STRING(36),
    `AchievementThreshold` STRING(36)
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS `OutcomesSetOrg` (
    `OutcomeSetId` INT64,
    `OutcomeSetName` STRING(256),
    `RegistryId` STRING(36),
    `CreatedDate` DATETIME,
    `CreatedBy` INT64,
    `LastModifiedDate` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `ScaleId` STRING(36)
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `PortfolioCategories` (
    `CategoryId` STRING(36),
    `OrgUnitId` INT64,
    `Name` STRING(256),
    `IsRetired` BOOL,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceCategories` (
    `CategoryId` STRING(36),
    `EvidenceId` STRING(36),
    `Group` STRING(30),
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceLog` (
    `LogId` STRING(36),
    `ParentObjectId` STRING(36),
    `ObjectId` STRING(36),
    `ObjectType` STRING(40),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `Action` STRING(16),
    `IsMobile` BOOL,
    `ActionDate` DATETIME
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `PortfolioEvidenceObjects` (
    `EvidenceId` STRING(36),
    `OwnerId` INT64,
    `OrgUnitId` INT64,
    `EvidenceType` STRING(30),
    `Title` STRING(1000),
    `IsApproved` BOOL,
    `IsSpotlighted` BOOL,
    `IsSharedToParents` BOOL,
    `IsDeleted` BOOL,
    `IsRecoverableByInstructor` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsSharedWithInstructor` BOOL,
    `DateSharedWithInstructor` DATETIME
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `PreRequisiteConditionsMet` (
    `PreRequisiteId` INT64,
    `UserId` INT64,
    `DateMet` DATETIME,
    `Action` STRING(7),
    `LastModified` DATETIME
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionAnswerOptions` (
    `AnswerId` INT64,
    `AnswerText` STRING(1000),
    `Weight` NUMERIC(19,9),
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `AnswerOptionId` INT64
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionAnswers` (
    `AnswerId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `SortOrder` INT64,
    `Weight` NUMERIC(19,9),
    `Answer` STRING(1000),
    `Comment` STRING(1000),
    `Description` STRING(256)
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionLibrary` (
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `IsAutoGraded` BOOL,
    `TemplateTypeId` INT64,
    `QuestionType` STRING(28),
    `Name` STRING(256),
    `Question` STRING(1000),
    `Comment` STRING(1000),
    `AnswerKey` STRING(1000),
    `CreationDate` DATETIME,
    `Version` INT64,
    `AllowsAttachments` BOOL,
    `AIUtilization` INT64
);

-- Question Pools
-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionPools` (
    `SectionId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Question Relationships
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `QuestionRelationships` (
    `CollectionId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `Order` INT64,
    `SectionId` INT64,
    `IsQuestionPool` BOOL,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Points` NUMERIC(19,9),
    `Difficulty` INT64,
    `IsBonus` BOOL,
    `IsMandatory` BOOL,
    `IsDeleted` BOOL,
    `Version` INT64,
    `ObjectId` INT64
);

-- Quiz Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttempts` (
    `AttemptId` INT64,
    `QuizId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `AttemptNumber` INT64,
    `TimeStarted` DATETIME,
    `TimeCompleted` DATETIME,
    `Score` NUMERIC(19,9),
    `IsGraded` BOOL,
    `OldAttemptNumber` INT64,
    `IsDeleted` BOOL,
    `PossibleScore` NUMERIC(19,9),
    `IsRetakeIncorrectOnly` BOOL,
    `DueDate` DATETIME,
    `TimeLimit` INT64,
    `TimeLimitEnforced` BOOL,
    `TimeLimitExceededBehaviour` STRING(128),
    `IsSynchronous` BOOL,
    `DeductionPercentage` INT64,
    `Version` INT64
);

-- Quiz Attempts Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizAttemptsLog` (
    `LogId` INT64,
    `AttemptId` INT64,
    `EventTypeId` INT64,
    `Name` STRING(256),
    `Description` STRING(256),
    `EventTime` DATETIME,
    `IPAddress` STRING(45),
    `UserId` INT64,
    `IsDeleted` BOOL
);

-- Quiz Objects
-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `QuizObjects` (
    `QuizId` INT64,
    `QuizName` STRING(256),
    `QuizDescription` STRING(1000),
    `QuizCategory` STRING(256),
    `IsActive` BOOL,
    `OrgUnitId` INT64,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DueDate` DATETIME,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `GradeObjectId` INT64,
    `OverallScoreCalculation` STRING(23),
    `QuizScoreDenominator` NUMERIC(19,9),
    `HasPassword` BOOL,
    `IPRestricted` BOOL,
    `TimeLimit` INT64,
    `TimeLimitEnforced` BOOL,
    `AttemptsAllowed` INT64,
    `PreventMovingBackwards` BOOL,
    `AllowHints` BOOL,
    `NotificationEmail` STRING(1000),
    `DisablePagerAccess` BOOL,
    `DisplayInCalendar` BOOL,
    `IsAttemptRldb` BOOL,
    `IsSubviewRldb` BOOL,
    `SortOrder` INT64,
    `CategoryId` INT64,
    `ResultId` INT64,
    `IsRetakeIncorrectOnly` BOOL,
    `PagingTypeId` INT64,
    `IsSynchronous` BOOL,
    `DeductionPercentage` INT64,
    `AIStudySupport` BOOL,
    `HideQuestionPoints` BOOL,
    `IsSingleSession` BOOL,
    `HideAnnotationTools` BOOL
);

-- Quiz Survey Sections
-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `QuizSurveySections` (
    `CollectionId` INT64,
    `SectionId` INT64,
    `Name` STRING(256),
    `NameIsDisplayed` BOOL,
    `IsQuestionPool` BOOL,
    `SectionText` STRING(1000),
    `SectionTextIsHTML` BOOL,
    `IsSectionTextHidden` BOOL,
    `QuestionPoints` NUMERIC(19,9),
    `NumQuestions` INT64,
    `NumChoices` INT64,
    `Shuffle` BOOL,
    `CreationDate` DATETIME,
    `CreatedBy` INT64,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Quiz User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS `QuizUserAnswerResponses` (
    `AttemptId` INT64,
    `AttemptNumber` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `AnswerId` INT64,
    `SortOrder` INT64,
    `IsCorrect` BOOL,
    `UserSelection` INT64,
    `UserAnswer` STRING(1000),
    `FileSetId` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL
);

-- Quiz User Answers
-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS `QuizUserAnswers` (
    `AttemptId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `TimeCompleted` DATETIME,
    `QuestionNumber` INT64,
    `Comment` STRING(1000),
    `SortOrder` INT64,
    `Score` NUMERIC(19,9),
    `Page` INT64,
    `SectionId` INT64,
    `ObjectId` INT64,
    `OutOf` NUMERIC(19,9),
    `TimeStarted` DATETIME,
    `IsBonus` BOOL,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `QuizTimeCompleted` DATETIME
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ReleaseConditionObjects` (
    `PreRequisiteId` INT64,
    `ResultId` INT64,
    `OrgUnitId` INT64,
    `Name` STRING(64),
    `IsNegativeCondition` BOOL,
    `PreRequisiteToolId` INT64,
    `Id1` INT64,
    `Id2` INT64,
    `ResultToolId` INT64,
    `UsesPercentage` BOOL,
    `OperatorTypeDesc` STRING(3),
    `Version` INT64,
    `Guid1` STRING(36),
    `Guid2` STRING(36)
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `ReleaseConditionResults` (
    `ResultId` INT64,
    `UserId` INT64,
    `Met` STRING(7),
    `Version` INT64,
    `DeletedDate` DATETIME
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `ReofferCourse` (
    `CourseOfferingId` INT64,
    `SourceCourseId` INT64,
    `CreatedBy` INT64,
    `ReofferDate` DATETIME
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `RoleDetails` (
    `RoleId` INT64,
    `RoleName` STRING(120),
    `Description` STRING(400),
    `IsCascading` BOOL,
    `InClassList` BOOL,
    `ClassListRoleName` STRING(120),
    `ClassListShowGroups` BOOL,
    `ClassListShowSections` BOOL,
    `ClassListDisplayRole` BOOL,
    `AccessInactiveCO` BOOL,
    `HasSpecialAccess` BOOL,
    `AddToCourseOfferingGroups` BOOL,
    `CanBeAutoEnrolledIntoGroups` BOOL,
    `AddToCourseOfferingSections` BOOL,
    `CanBeAutoEnrolledIntoSections` BOOL,
    `AccessPastCourses` BOOL,
    `AccessFutureCourses` BOOL,
    `SortOrder` INT64,
    `ShowInContent` BOOL,
    `ShowInDiscussionAssess` BOOL,
    `ShowInDiscussionStats` BOOL,
    `ShowInGrades` BOOL,
    `ShowInAttendance` BOOL,
    `AllowSelfEnrollInGroups` BOOL,
    `ShowInRegistration` BOOL,
    `ShowInUserProgress` BOOL,
    `RoleAlias` STRING(120),
    `RoleCode` STRING(100),
    `LastModifiedDate` DATETIME,
    `DeletedBy` INT64
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `RubricAssessment` (
    `RubricId` INT64,
    `OrgUnitId` INT64,
    `UserId` INT64,
    `Score` BIGNUMERIC(36,2),
    `AssessedByUserId` INT64,
    `AssessmentDate` DATETIME,
    `IsCompleted` BOOL,
    `ActivityType` STRING(50),
    `ActivityObjectId` INT64,
    `DateCreated` DATETIME,
    `AssessmentId` INT64,
    `LevelAchievedId` INT64,
    `ActivityId` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Rubric Assessment Criteria
-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricAssessmentCriteria` (
    `AssessmentId` INT64,
    `RubricId` INT64,
    `Score` NUMERIC(19,9),
    `Feedback` STRING(4000),
    `IsScoreOverridden` BOOL,
    `CriterionId` INT64,
    `LevelAchievedId` INT64,
    `Version` INT64
);

-- Rubric Criteria Levels
-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `RubricCriteriaLevels` (
    `RubricId` INT64,
    `CriterionId` INT64,
    `Description` STRING(1000),
    `Feedback` STRING(1000),
    `Value` NUMERIC(19,9),
    `LevelId` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Rubric Object Criteria
-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricObjectCriteria` (
    `RubricId` INT64,
    `CriterionId` INT64,
    `Name` STRING(500),
    `SortOrder` INT64,
    `CriteriaGroupId` INT64,
    `GroupName` STRING(256),
    `GroupSortOrder` INT64,
    `LevelSetId` INT64,
    `IsDeleted` BOOL
);

-- Rubric Object Levels
-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricObjectLevels` (
    `RubricId` INT64,
    `LevelId` INT64,
    `Name` STRING(256),
    `Description` STRING(1000),
    `Feedback` STRING(1000),
    `Value` NUMERIC(19,9),
    `RangeStartValue` NUMERIC(19,9),
    `SortOrder` INT64,
    `LevelSetId` INT64,
    `IsDeleted` BOOL
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `RubricObjects` (
    `RubricId` INT64,
    `Name` STRING(256),
    `RubricStatus` STRING(256),
    `Description` STRING(1000),
    `RubricType` STRING(256),
    `ScoringMethods` STRING(256),
    `IsScoreVisible` BOOL,
    `OrgUnitID` INT64,
    `IsShared` BOOL,
    `IsDeleted` BOOL
);

-- Rubrics Edit
-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS `RubricsEdit` (
    `AuditLogId` STRING(36),
    `RubricId` INT64,
    `CriterionId` INT64,
    `LevelId` INT64,
    `ModifiedBy` INT64,
    `ModifiedObjectType` INT64,
    `CriteriaGroupId` INT64,
    `ModifiedDate` DATETIME,
    `PreviousValue` STRING(4000),
    `ModifiedValue` STRING(4000),
    `IsLocked` BOOL,
    `Version` INT64
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMActivities` (
    `ActivityId` STRING(36),
    `ScormObjectId` STRING(36),
    `ParentActivityId` STRING(36),
    `NumChildren` INT64,
    `InternalId` STRING(255),
    `Title` STRING(200),
    `CompletionThreshold` FLOAT64,
    `PassingScore` FLOAT64,
    `PassingScoreUsed` BOOL,
    `ScoreMin` FLOAT64,
    `ScoreMax` FLOAT64,
    `LastModified` DATETIME
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMActivityAttempts` (
    `VisitId` STRING(36),
    `ActivityId` STRING(36),
    `AttemptNumber` INT64,
    `Completion` STRING(100),
    `Success` STRING(100),
    `Score` FLOAT64,
    `ScoreRaw` FLOAT64,
    `TimeSpent` FLOAT64,
    `Progress` FLOAT64,
    `LastModified` DATETIME
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMInteractionAttempts` (
    `VisitId` STRING(36),
    `InteractionId` STRING(36),
    `AttemptNumber` INT64,
    `ActivityId` STRING(36),
    `Timestamp` DATETIME,
    `Response` STRING(1000),
    `Result` STRING(100),
    `NumericResult` FLOAT64,
    `TimeSpent` FLOAT64,
    `LastModified` DATETIME
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS `SCORMInteractionObjectives` (
    `InteractionId` STRING(36),
    `ObjectiveId` STRING(36),
    `LastModified` DATETIME
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS `SCORMInteractions` (
    `InteractionId` STRING(36),
    `ActivityId` STRING(36),
    `InternalId` STRING(255),
    `InteractionType` STRING(100),
    `Description` STRING(250),
    `Weighting` FLOAT64,
    `CorrectResponses` STRING(2000),
    `LastModified` DATETIME
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS `SCORMObjectiveAttempts` (
    `VisitId` STRING(36),
    `ObjectiveId` STRING(36),
    `AttemptNumber` INT64,
    `Score` FLOAT64,
    `ScoreRaw` FLOAT64,
    `Success` STRING(100),
    `Completion` STRING(100),
    `Progress` FLOAT64,
    `LastModified` DATETIME
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS `SCORMObjectives` (
    `ObjectiveId` STRING(36),
    `ScormObjectId` STRING(36),
    `ObjectiveType` STRING(100),
    `ActivityId` STRING(36),
    `InternalId` STRING(255),
    `IsPrimary` BOOL,
    `Description` STRING(250),
    `ScoreMin` FLOAT64,
    `ScoreMax` FLOAT64,
    `LastModified` DATETIME
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SCORMObjects` (
    `ScormObjectId` STRING(36),
    `OrgUnitId` INT64,
    `ContentObjectId` INT64,
    `ContentServiceContentId` STRING(36),
    `ContentServiceRevisionId` STRING(36),
    `ContentServiceTopicId` STRING(36),
    `Title` STRING(1000),
    `Description` STRING(1000),
    `LearningStandard` STRING(100),
    `LastModified` DATETIME,
    `LastModifiedBy` INT64
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SCORMVisits` (
    `VisitId` STRING(36),
    `ScormObjectId` STRING(36),
    `UserId` INT64,
    `OrgUnitId` INT64,
    `FirstAccessDate` DATETIME,
    `LastAccessDate` DATETIME,
    `CompletedDate` DATETIME,
    `Completion` STRING(100),
    `Success` STRING(100),
    `Score` FLOAT64,
    `TimeSpent` INT64,
    `Progress` FLOAT64,
    `LastModified` DATETIME
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SessionHistory` (
    `SessionId` INT64,
    `OrgId` INT64,
    `UserId` INT64,
    `DateStarted` DATETIME,
    `DateEnded` DATETIME,
    `LastAccessed` DATETIME,
    `TimedOut` BOOL,
    `HistoryID` INT64
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SISCourseMergeLog` (
    `BatchId` STRING(36),
    `JobType` STRING(32),
    `Status` STRING(32),
    `OriginalTargetOrgUnitId` INT64,
    `OriginalSourceOrgUnitId` INT64,
    `SourceSystemId` INT64,
    `NumberOfCoursesInBatch` INT64,
    `UserId` INT64,
    `ErrorType` STRING(48),
    `Timestamp` DATETIME
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SourceCourseDeployHistory` (
    `SourceCourseDeployId` INT64,
    `SourceCourseOrgUnitId` INT64,
    `TargetCourseOrgUnitId` INT64,
    `UserId` INT64,
    `Status` STRING(128),
    `QueuedTime` DATETIME,
    `CompletionTime` DATETIME
);

-- Survey Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SurveyAttempts` (
    `AttemptId` INT64,
    `SurveyId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `AttemptNumber` INT64,
    `TimeStarted` DATETIME,
    `TimeCompleted` DATETIME,
    `AttemptedFromOrgUnitId` INT64,
    `OldAttemptNumber` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- Survey Objects
-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `SurveyObjects` (
    `SurveyId` INT64,
    `SurveyName` STRING(1000),
    `CategoryId` INT64,
    `OrgUnitId` INT64,
    `Description` STRING(1000),
    `DescriptionEnabled` BOOL,
    `HasInstantFeedback` BOOL,
    `IsAnonymous` BOOL,
    `IsVisible` BOOL,
    `SubmissionMessage` STRING(1000),
    `Footer` STRING(1000),
    `FooterIsDisplayed` BOOL,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `DisplayInCalendar` BOOL,
    `ResultId` INT64,
    `AttemptsAllowed` INT64,
    `SortOrder` INT64,
    `CreatedBy` INT64,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `Version` INT64,
    `CategoryName` STRING(256)
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
CREATE TABLE IF NOT EXISTS `SurveyUserAnswerResponses` (
    `AttemptId` INT64,
    `AttemptNumber` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `AnswerId` INT64,
    `SortOrder` INT64,
    `IsCorrect` BOOL,
    `UserSelection` INT64,
    `UserAnswer` STRING(1000),
    `FileSetId` INT64,
    `LastModified` DATETIME,
    `IsDeleted` BOOL
);

-- Survey User Answers
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `SurveyUserAnswers` (
    `AttemptId` INT64,
    `QuestionId` INT64,
    `QuestionVersionId` INT64,
    `TimeCompleted` DATETIME,
    `QuestionNumber` INT64,
    `Comment` STRING(1000),
    `SortOrder` INT64,
    `Score` NUMERIC(19,9),
    `Page` INT64,
    `Assigned` BOOL,
    `IsDeleted` BOOL,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `SurveyTimeCompleted` DATETIME
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SystemAccessLog` (
    `SessionId` STRING(36),
    `UserId` INT64,
    `Timestamp` DATETIME,
    `State` STRING(20),
    `Source` STRING(20),
    `AppVersion` STRING(20),
    `Device` STRING(50),
    `IsOfflineMode` BOOL,
    `IPAddress` STRING(45)
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `SystemAccessSummary` (
    `UserId` INT64,
    `ImpersonatingUserId` INT64,
    `LastSystemAccess` DATETIME,
    `Source` STRING(20)
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `Tools` (
    `ToolId` INT64,
    `Name` STRING(50),
    `DisplayName` STRING(200),
    `Version` INT64
);

-- TurnItIn Submissions
-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS `TurnItInSubmissions` (
    `DropboxId` INT64,
    `SubmissionId` INT64,
    `FileId` INT64,
    `LastSubmissionDate` DATETIME,
    `SubmissionStatus` INT64,
    `SubmissionErrorType` INT64,
    `ErrorMessage` STRING(255),
    `SubmittedBy` INT64,
    `LastRefreshDate` DATETIME,
    `LastModified` DATETIME
);

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserAttributeDefinitions` (
    `AttributeId` STRING(128),
    `Name` STRING(128),
    `Type` STRING(8),
    `AllowMultiple` BOOL,
    `IsDefault` BOOL,
    `LastModified` DATETIME,
    `ModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- User Attribute Values
-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
    `UserId` INT64,
    `AttributeId` STRING(128),
    `Value` STRING(4000),
    `LastModified` DATETIME,
    `ModifiedBy` INT64,
    `IsDeleted` BOOL,
    `Version` INT64
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserEnrollments` (
    `OrgUnitId` INT64,
    `UserId` INT64,
    `RoleName` STRING(60),
    `EnrollmentDate` DATETIME,
    `EnrollmentType` STRING(50),
    `RoleId` INT64
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `UserLogins` (
    `UserId` INT64,
    `UserName` STRING(256),
    `IP` STRING(64),
    `SessionId` INT64,
    `StatusType` STRING(50),
    `AttemptDate` DATETIME,
    `ImpersonatingUserId` INT64,
    `LoginAttemptId` STRING(36),
    `LoginSource` STRING(50)
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS `Users` (
    `UserId` INT64,
    `UserName` STRING(270),
    `OrgDefinedId` STRING(256),
    `FirstName` STRING(64),
    `MiddleName` STRING(64),
    `LastName` STRING(64),
    `IsActive` BOOL,
    `ExternalEmail` STRING(256),
    `CreationDate` DATETIME,
    `Version` INT64,
    `OrgRoleId` INT64,
    `DateDeleted` DATETIME
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `VirtualClassroomUsage` (
    `OrgUnitId` INT64,
    `CourseName` STRING(255),
    `MeetingId` STRING(36),
    `MeetingName` STRING(255),
    `CreationUserId` INT64,
    `CreationDate` DATETIME,
    `ScheduledDate` DATETIME,
    `ScheduledDuration` INT64,
    `IsPublished` BOOL,
    `ExternalLinksEnabled` BOOL,
    `WholeClassInvited` BOOL,
    `IsCancelled` BOOL,
    `StartDateTime` DATETIME,
    `EndDateTime` DATETIME,
    `IsRecorded` BOOL
);
