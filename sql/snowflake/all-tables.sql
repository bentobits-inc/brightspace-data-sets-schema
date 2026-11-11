-- All 144 Brightspace Data Sets tables for Snowflake (current).
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Accommodations Profile Log
-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AccommodationsProfileLog" (
    "AccommodatedUserId" BIGINT,
    "OrgUnitId" BIGINT,
    "QuizTimeLimitMultiplier" NUMBER(5,2),
    "QuizTimeLimitExtraTime" INT,
    "QuizControlAlwaysAllowRightClick" BOOLEAN,
    "ModifiedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityExemptionsLog" (
    "OrgUnitId" INT,
    "UserId" INT,
    "ObjectId" INT,
    "ActivityId" VARCHAR(225),
    "LogTypeName" VARCHAR(50),
    "LastModifiedUtc" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "ActivityExemptionsLogId" BIGINT,
    "ToolId" INT
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentLog" (
    "LogId" VARCHAR(36),
    "UserId" INT,
    "OrgUnitId" INT,
    "CommentId" VARCHAR(36),
    "Action" VARCHAR(16),
    "ActionDate" TIMESTAMP_NTZ,
    "Content" VARCHAR(3072),
    "PostId" VARCHAR(36)
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentObjects" (
    "OrgUnitId" INT,
    "CommentId" VARCHAR(36),
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ,
    "Content" VARCHAR(3072),
    "IsDeleted" BOOLEAN,
    "PostId" VARCHAR(36),
    "Version" BIGINT
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostLog" (
    "LogId" VARCHAR(36),
    "UserId" INT,
    "OrgUnitId" INT,
    "PostId" VARCHAR(36),
    "PostType" VARCHAR(16),
    "Action" VARCHAR(16),
    "ActionDate" TIMESTAMP_NTZ,
    "DropboxId" BIGINT,
    "Content" VARCHAR(3072),
    "CommentCount" INT,
    "AttachmentCount" INT
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostObjects" (
    "OrgUnitId" INT,
    "PostId" VARCHAR(36),
    "PostType" VARCHAR(16),
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ,
    "DropboxId" BIGINT,
    "Content" VARCHAR(3072),
    "IsDeleted" BOOLEAN,
    "CommentCount" INT,
    "AttachmentCount" INT,
    "Version" BIGINT
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AIConsumption" (
    "ConsumptionId" VARCHAR(255),
    "UserId" INT,
    "OrgUnitId" INT,
    "Date" TIMESTAMP_NTZ,
    "GenerationCount" INT,
    "ConsumptionSource" INT
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "Announcements" (
    "AnnouncementId" BIGINT,
    "OrgUnitId" BIGINT,
    "Title" VARCHAR(400),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsGlobal" BOOLEAN,
    "IsDraft" BOOLEAN,
    "NumAttachments" INT,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "CreatedBy" INT,
    "IsAuthorInfoShown" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "ResultId" BIGINT
);

-- Assignment Special Access
-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AssignmentSpecialAccess" (
    "DropboxId" BIGINT,
    "UserId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "ModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "StartDateAvailabilityType" SMALLINT,
    "EndDateAvailabilityType" SMALLINT
);

-- Assignment Submission Details
-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AssignmentSubmissionDetails" (
    "SubmissionId" BIGINT,
    "DropboxId" BIGINT,
    "UserId" BIGINT,
    "GroupId" BIGINT,
    "NumberOfFilesSubmitted" INT,
    "TotalFileSize" BIGINT,
    "SubmittedByUserId" INT,
    "DateSubmitted" TIMESTAMP_NTZ,
    "Comments" VARCHAR(1000),
    "IsTurnItInExempt" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "IsPreview" BOOLEAN,
    "Version" BIGINT
);

-- Assignment Submissions
-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSubmissions" (
    "DropboxId" BIGINT,
    "OrgUnitId" INT,
    "SubmitterId" BIGINT,
    "SubmitterType" VARCHAR(5),
    "FileSubmissionCount" INT,
    "TotalFileSize" BIGINT,
    "FeedbackUserId" INT,
    "FeedbackIsRead" BOOLEAN,
    "Score" NUMBER(19,9),
    "IsGraded" BOOLEAN,
    "LastSubmissionDate" TIMESTAMP_NTZ,
    "Feedback" VARCHAR(1000),
    "FeedbackLastModified" TIMESTAMP_NTZ,
    "FeedbackReadDate" TIMESTAMP_NTZ,
    "CompletionDate" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(128),
    "Category" VARCHAR(128),
    "Type" VARCHAR(10),
    "GradeItemId" BIGINT,
    "PossibleScore" NUMBER(19,9),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "IsRestricted" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "TurnItInEnabled" BOOLEAN,
    "IsHidden" BOOLEAN,
    "SortOrder" INT,
    "SubmissionType" VARCHAR(18),
    "CompletionType" VARCHAR(27),
    "ResultId" INT,
    "CategoryId" BIGINT,
    "Version" BIGINT,
    "StartDateAvailabilityType" SMALLINT,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INT,
    "Instructions" VARCHAR(10000)
);

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceRegisters" (
    "AttendanceRegisterId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(128),
    "Description" VARCHAR(1000),
    "SchemeId" BIGINT,
    "IsVisible" BOOLEAN,
    "IncludeAllUsers" BOOLEAN,
    "CauseForConcern" NUMBER(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceSchemes" (
    "SchemeId" BIGINT,
    "OrgUnitId" INT,
    "SchemeName" VARCHAR(128),
    "SchemeSymbolId" BIGINT,
    "SymbolName" VARCHAR(128),
    "SymbolValue" VARCHAR(50),
    "Percentage" NUMBER(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
CREATE TABLE IF NOT EXISTS "AttendanceSessions" (
    "AttendanceSessionId" BIGINT,
    "AttendanceRegisterId" BIGINT,
    "Name" VARCHAR(128),
    "Description" VARCHAR(256),
    "SortOrder" INT,
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS "AttendanceUserSessions" (
    "UserId" INT,
    "AttendanceSessionId" BIGINT,
    "SchemeSymbolId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS "AudioVideoProcessed" (
    "ContentId" VARCHAR(36),
    "RevisionId" VARCHAR(36),
    "RevisionNumber" INT,
    "Type" VARCHAR(5),
    "Source" VARCHAR(32),
    "RevisionSize" BIGINT,
    "Duration" INT,
    "RequiredTranscoding" BOOLEAN,
    "RequiredTranscribing" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AuditorRelationshipsLog" (
    "AuditorId" INT,
    "UserToAuditId" INT,
    "OrgUnitId" INT,
    "Action" VARCHAR(16),
    "ModifiedBy" INT,
    "ModifiedDate" TIMESTAMP_NTZ
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "AwardObjects" (
    "AwardId" BIGINT,
    "Name" VARCHAR(256),
    "AwardTypeId" INT,
    "Type" VARCHAR(128),
    "Description" VARCHAR(512),
    "ExpiryCalculationType" VARCHAR(128),
    "ExpiryNotificationType" VARCHAR(128),
    "ExpiryDate" TIMESTAMP_NTZ,
    "ImagePath" VARCHAR(1000),
    "CreatedByUserId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "Criteria" VARCHAR(1000)
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
CREATE TABLE IF NOT EXISTS "AwardsIssued" (
    "AwardId" BIGINT,
    "OrgUnitId" BIGINT,
    "UserId" BIGINT,
    "IssuedBy" INT,
    "IssueDate" TIMESTAMP_NTZ,
    "ExpiryDate" TIMESTAMP_NTZ,
    "IssuedId" BIGINT,
    "Criteria" VARCHAR(1000),
    "Evidence" VARCHAR(1000),
    "RevokedDate" TIMESTAMP_NTZ,
    "RevokedReason" VARCHAR(1000),
    "RevokedBy" BIGINT,
    "LastModifiedBy" BIGINT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "CertificateId" VARCHAR(12)
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "BrightspaceEmailLog" (
    "MailId" INT,
    "SenderUserId" INT,
    "SenderAddress" VARCHAR(256),
    "RecipientAddress" VARCHAR(256),
    "RecipientType" VARCHAR(4),
    "DateTimeSent" TIMESTAMP_NTZ,
    "Subject" VARCHAR(1000)
);

-- Calendar Events
-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CalendarEvents" (
    "ScheduleId" BIGINT,
    "OrgUnitId" BIGINT,
    "UserId" BIGINT,
    "Title" VARCHAR(256),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "TimeZoneIdentifier" VARCHAR(256),
    "IsAllDayEvent" BOOLEAN,
    "RecurrenceType" VARCHAR(7),
    "RecurrenceInterval" INT,
    "CreatedByUserId" INT,
    "LastModified" TIMESTAMP_NTZ,
    "EventObjectTypeName" VARCHAR(200),
    "ObjectLookupId1" BIGINT,
    "ObjectLookupId2" BIGINT
);

-- Checklist Category Details
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCategoryDetails" (
    "CategoryId" BIGINT,
    "ChecklistId" BIGINT,
    "Name" VARCHAR(512),
    "Description" VARCHAR(1000),
    "DescriptionIsHtml" BOOLEAN,
    "SortOrder" INT,
    "LastModifiedUtc" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT,
    "Version" BIGINT
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCompletions" (
    "UserId" INT,
    "DateCompleted" TIMESTAMP_NTZ,
    "ItemId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "IsCompleted" BOOLEAN,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT,
    "Version" BIGINT
);

-- Checklist Item Details
-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistItemDetails" (
    "ItemId" BIGINT,
    "CategoryId" BIGINT,
    "Name" VARCHAR(512),
    "Description" VARCHAR(1000),
    "DescriptionIsHtml" BOOLEAN,
    "DueDate" TIMESTAMP_NTZ,
    "ScheduleId" INT,
    "SortOrder" INT,
    "IsAutoChecked" BOOLEAN,
    "LastModifiedUtc" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT,
    "Version" BIGINT
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ChecklistObjects" (
    "ChecklistId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(512),
    "Description" VARCHAR(1000),
    "DescriptionIsHtml" BOOLEAN,
    "SharedUserId" INT,
    "DisplayInNewWindow" BOOLEAN,
    "SortOrder" INT,
    "Version" BIGINT,
    "ResultId" INT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyActivities" (
    "ActivityId" BIGINT,
    "OrgUnitId" INT,
    "ActivityName" VARCHAR(256),
    "ActivityTypeId" INT,
    "AssessmentType" VARCHAR(7),
    "ObjectLookupId" BIGINT,
    "RubricId" BIGINT,
    "LevelId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AssessmentThresholdCriteria" VARCHAR(2),
    "AssessmentThreshold" NUMBER(19,9),
    "IsAutoEval" BOOLEAN,
    "RubricName" VARCHAR(256),
    "RubricLevelRequired" VARCHAR(256),
    "ObjectId" BIGINT,
    "ActivityType" VARCHAR(50),
    "Version" BIGINT
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityLog" (
    "ActivityId" BIGINT,
    "ActivityLogId" BIGINT,
    "LogTypeId" INT,
    "LogTypeName" VARCHAR(19),
    "LogDateTime" TIMESTAMP_NTZ,
    "ModifiedBy" BIGINT
);

-- Competency Activity Results
-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityResults" (
    "ActivityId" BIGINT,
    "OrgUnitId" INT,
    "UserId" INT,
    "LearningObjectId" BIGINT,
    "IsAchieved" BOOLEAN,
    "PercentAchieved" NUMBER(19,9),
    "RubricScore" NUMBER(19,9),
    "RubricLevelAchieved" VARCHAR(256),
    "RubricId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AchievedDate" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS "CompetencyLog" (
    "CompetencyLogId" BIGINT,
    "LogTypeId" INT,
    "LogTypeName" VARCHAR(19),
    "ObjectId" BIGINT,
    "ObjectTypeId" INT,
    "ObjectTypeName" VARCHAR(18),
    "ObjectVersion" INT,
    "LogDateTime" TIMESTAMP_NTZ,
    "ModifiedBy" BIGINT,
    "IndirectObjectId" BIGINT,
    "IndirectObjectTypeName" VARCHAR(18),
    "IndirectObjectTypeId" INT,
    "IndirectObjectVersion" INT
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyObjects" (
    "ObjectId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(256),
    "Type" VARCHAR(256),
    "ReadyForEvaluation" BOOLEAN,
    "Status" VARCHAR(9),
    "Description" VARCHAR(1000),
    "NeedReevaluation" BOOLEAN,
    "ReevaluationIfAchieved" BOOLEAN,
    "ReevaluationIfNotAchieved" BOOLEAN,
    "AdditionalIdentifier" VARCHAR(512),
    "IsHidden" BOOLEAN
);

-- Competency Structure
-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS "CompetencyStructure" (
    "ObjectId" BIGINT,
    "ParentObjectId" BIGINT,
    "BaseObjectID" BIGINT,
    "Depth" INT,
    "EntryTime" INT
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" INT,
    "ContentObjectId" INT,
    "Action" VARCHAR(10),
    "FilePath" VARCHAR(10000),
    "FileName" VARCHAR(512),
    "FileExtension" VARCHAR(512),
    "FileSizeBytes" BIGINT,
    "UploadDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS "ContentObjects" (
    "ContentObjectId" INT,
    "OrgUnitId" INT,
    "Title" VARCHAR(150),
    "ContentObjectType" VARCHAR(6),
    "CompletionType" VARCHAR(7),
    "ParentContentObjectId" INT,
    "Location" VARCHAR(1024),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "ObjectId1" INT,
    "ObjectId2" INT,
    "ObjectId3" INT,
    "LastModified" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "SortOrder" INT,
    "Depth" INT,
    "ToolId" INT,
    "IsHidden" BOOLEAN,
    "ResultId" INT,
    "DeletedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedBy" INT,
    "DeletedBy" INT,
    "AIUtilization" INT,
    "Version" BIGINT
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserCompletion" (
    "ContentObjectId" INT,
    "OrgUnitId" INT,
    "UserId" INT,
    "DateCompleted" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "AutomaticDateCompleted" TIMESTAMP_NTZ,
    "ManualDateCompleted" TIMESTAMP_NTZ
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserProgress" (
    "ContentObjectId" INT,
    "UserId" INT,
    "CompletedDate" TIMESTAMP_NTZ,
    "LastVisited" TIMESTAMP_NTZ,
    "IsRead" BOOLEAN,
    "NumRealVisits" INT,
    "NumFakeVisits" INT,
    "TotalTime" BIGINT,
    "IsVisited" BOOLEAN,
    "IsCurrentBookmark" BOOLEAN,
    "IsSelfAssessComplete" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccess" (
    "OrgUnitId" INT,
    "UserId" INT,
    "DayAccessed" TIMESTAMP_NTZ
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccessLog" (
    "OrgUnitId" INT,
    "UserId" INT,
    "Timestamp" TIMESTAMP_NTZ,
    "Source" VARCHAR(20)
);

-- Course Awards
-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CourseAwards" (
    "AssociationId" BIGINT,
    "AwardId" BIGINT,
    "OrgUnitId" BIGINT,
    "DateCreated" TIMESTAMP_NTZ,
    "HiddenAward" BOOLEAN,
    "ConditionSetId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "Credits" NUMBER(9,2),
    "IsAssociated" BOOLEAN,
    "Version" BIGINT
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseCopyLogs" (
    "SourceOrgUnitId" INT,
    "DestinationOrgUnitId" INT,
    "UserId" BIGINT,
    "Status" VARCHAR(128),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsDestinationNew" BOOLEAN,
    "CopyProtectedResources" BOOLEAN,
    "CopyCourseJobId" BIGINT,
    "StatusId" INT
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CoursePublisherLaunches" (
    "LaunchId" VARCHAR(36),
    "OrgUnitId" INT,
    "RecipientId" VARCHAR(36),
    "UserId" INT,
    "RoleId" INT,
    "LaunchMethod" VARCHAR(256),
    "ExternalUserId" VARCHAR(256),
    "ExternalLMSType" VARCHAR(256),
    "IsNewUser" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CoursePublisherRecipients" (
    "RecipientID" VARCHAR(36),
    "Name" VARCHAR(256),
    "CreatedAt" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDCategories" (
    "CategoryId" INT,
    "Name" VARCHAR(256),
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS "CPDJobTargets" (
    "PrincipalId" INT,
    "CategoryId" INT,
    "JobTitle" VARCHAR(256),
    "StructuredMinutes" INT,
    "UnstructuredMinutes" INT,
    "StructuredRecordCount" INT,
    "UnstructuredRecordCount" INT,
    "StartDate" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDMethods" (
    "MethodId" INT,
    "Name" VARCHAR(4000),
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDQuestionAnswers" (
    "AnswerId" INT,
    "AnswerText" VARCHAR(4000),
    "QuestionId" INT,
    "RecordId" INT,
    "UserId" INT,
    "Action" VARCHAR(16),
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDQuestions" (
    "QuestionId" INT,
    "QuestionText" VARCHAR(4000),
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserRecords" (
    "RecordId" INT,
    "RecordName" VARCHAR(256),
    "State" VARCHAR(50),
    "UserId" INT,
    "Category" INT,
    "Method" INT,
    "CreditMinutes" INT,
    "Evidence" VARCHAR(4000),
    "Type" VARCHAR(50),
    "Grade" NUMBER(4,3),
    "DateCompleted" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserTargets" (
    "PrincipalId" INT,
    "CategoryId" INT,
    "UserId" INT,
    "StructuredMinutes" INT,
    "UnstructuredMinutes" INT,
    "StructuredRecordCount" INT,
    "UnstructuredRecordCount" INT,
    "StartDate" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CreatorPracticesAdoption" (
    "ActivityInstanceId" INT,
    "CreatedById" INT,
    "OrgUnitId" INT,
    "PracticeType" VARCHAR(32),
    "PracticeTitle" VARCHAR(255),
    "ProviderObjectId" INT,
    "CreatedDate" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CreatorPracticesEngagement" (
    "PracticeEngagementId" INT,
    "UserId" INT,
    "OrgUnitId" INT,
    "CompletionStatus" VARCHAR(10),
    "ActivityInstanceId" INT,
    "CompletionDate" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionForums" (
    "OrgUnitId" INT,
    "ForumId" BIGINT,
    "Name" VARCHAR(400),
    "Description" VARCHAR(1000),
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "SortOrder" INT,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "ResultId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP_NTZ,
    "EndDateAvailabilityType" SMALLINT,
    "Version" BIGINT
);

-- Discussion Posts
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionPosts" (
    "OrgUnitId" INT,
    "TopicId" BIGINT,
    "UserId" INT,
    "PostId" BIGINT,
    "ThreadId" BIGINT,
    "IsReply" BOOLEAN,
    "ParentPostId" BIGINT,
    "NumReplies" INT,
    "DatePosted" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "RatingSum" BIGINT,
    "NumRatings" BIGINT,
    "Score" NUMBER(19,9),
    "LastEditDate" TIMESTAMP_NTZ,
    "SortOrder" INT,
    "Depth" INT,
    "Thread" VARCHAR(400),
    "WordCount" INT,
    "AttachmentCount" INT,
    "Version" BIGINT
);

-- Discussion Posts Read Status
-- Primary key (informational, not enforced): UserId, PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): PostId -> DiscussionPosts.PostId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionPostsReadStatus" (
    "TopicId" BIGINT,
    "UserId" INT,
    "PostId" BIGINT,
    "IsRead" BOOLEAN,
    "FirstReadDate" TIMESTAMP_NTZ,
    "LastReadDate" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionTopicUserScores" (
    "UserId" INT,
    "TopicId" BIGINT,
    "Score" NUMBER(19,9),
    "IsGraded" BOOLEAN,
    "Version" BIGINT,
    "IsDeleted" BOOLEAN
);

-- Discussion Topics
-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionTopics" (
    "OrgUnitId" INT,
    "TopicId" BIGINT,
    "ForumId" BIGINT,
    "Name" VARCHAR(1000),
    "Description" VARCHAR(1000),
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "LastPostDate" TIMESTAMP_NTZ,
    "LastPostUserId" BIGINT,
    "NumViews" BIGINT,
    "SortOrder" INT,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "GradeItemId" INT,
    "ScoreOutOf" FLOAT,
    "ScoreCalculationMethod" VARCHAR(19),
    "IncludeNonScoredValues" BOOLEAN,
    "Version" BIGINT,
    "ResultId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP_NTZ,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INT,
    "DueDate" TIMESTAMP_NTZ
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "EnrollmentsAndWithdrawals" (
    "LogId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "RoleId" INT,
    "Action" VARCHAR(50),
    "ModifiedByUserId" INT,
    "EnrollmentDate" TIMESTAMP_NTZ
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeBookSettings" (
    "OrgUnitId" INT,
    "GradeSchemeId" BIGINT,
    "GradingSystem" VARCHAR(8),
    "UngradedItems" VARCHAR(25),
    "IsAdjustedFinalGradeReleased" BOOLEAN,
    "IsCalculatedFinalGradeReleased" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeObjects" (
    "GradeObjectId" INT,
    "OrgUnitId" INT,
    "ParentGradeObjectId" INT,
    "Name" VARCHAR(128),
    "TypeName" VARCHAR(50),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsAutoPointed" BOOLEAN,
    "IsFormula" BOOLEAN,
    "IsBonus" BOOLEAN,
    "MaxPoints" NUMBER(19,9),
    "CanExceedMaxGrade" BOOLEAN,
    "ExcludeFromFinalGradeCalc" BOOLEAN,
    "GradeSchemeId" BIGINT,
    "Weight" NUMBER(19,9),
    "NumLowestGradesToDrop" INT,
    "NumHighestGradesToDrop" INT,
    "WeightDistributionType" VARCHAR(8),
    "CreatedDate" TIMESTAMP_NTZ,
    "ToolName" VARCHAR(50),
    "AssociatedToolItemId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "ShortName" VARCHAR(128),
    "GradeObjectTypeId" INT,
    "SortOrder" INT,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "ResultId" INT,
    "ToolId" INT,
    "Version" INT
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeObjectsLog" (
    "LogId" BIGINT,
    "Name" VARCHAR(50),
    "GradeObjectId" INT,
    "UserId" INT,
    "GradeSymbolString" VARCHAR(50),
    "PointsDenominator" NUMBER(19,9),
    "PointsNumerator" NUMBER(19,9),
    "WeightedDenominator" NUMBER(19,9),
    "WeightedNumerator" NUMBER(19,9),
    "Modified" TIMESTAMP_NTZ,
    "ModifiedBy" INT
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" INT,
    "OrgUnitId" INT,
    "UserId" INT,
    "PointsNumerator" NUMBER(19,9),
    "PointsDenominator" NUMBER(19,9),
    "WeightedNumerator" NUMBER(19,9),
    "WeightedDenominator" NUMBER(19,9),
    "IsReleased" BOOLEAN,
    "IsDropped" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "Comments" VARCHAR(1000),
    "PrivateComments" VARCHAR(1000),
    "GradeText" VARCHAR(50),
    "GradeReleasedDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "IsDeleted" BOOLEAN
);

-- Grade Scheme Ranges
-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS "GradeSchemeRanges" (
    "GradeSchemeRangeId" BIGINT,
    "GradeSchemeId" BIGINT,
    "SymbolString" VARCHAR(100),
    "AssignedValue" NUMBER(19,9),
    "RangeStart" NUMBER(19,9),
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeSchemes" (
    "GradeSchemeId" BIGINT,
    "OrgUnitId" INT,
    "SchemeName" VARCHAR(128),
    "DeletedDate" TIMESTAMP_NTZ,
    "Version" BIGINT
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "IntelligentAgentObjects" (
    "AgentId" BIGINT,
    "OrgUnitId" INT,
    "AgentName" VARCHAR(128),
    "Description" VARCHAR(1000),
    "Enabled" BOOLEAN,
    "SpecificRoles" VARCHAR(1000),
    "LoginConditionEnabled" BOOLEAN,
    "LoginConditionThreshold" INT,
    "LoginConditionType" VARCHAR(14),
    "AccessConditionEnabled" BOOLEAN,
    "AccessConditionThreshold" INT,
    "AccessConditionType" VARCHAR(20),
    "ResultId" BIGINT,
    "RepeatType" VARCHAR(10),
    "EmailWhenSatisfied" BOOLEAN,
    "EnableSchedule" BOOLEAN,
    "ScheduleType" VARCHAR(10),
    "ScheduleRepeatsEvery" INT,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Intelligent Agent Run Log
-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
CREATE TABLE IF NOT EXISTS "IntelligentAgentRunLog" (
    "AgentId" BIGINT,
    "AgentRunId" BIGINT,
    "IsPracticeRun" BOOLEAN,
    "IsRunNow" BOOLEAN,
    "NumUsers" INT,
    "NumUsersWithErrors" INT,
    "NumUsersWithInfos" INT,
    "NumUsersWithWarnings" INT,
    "RunUserId" INT,
    "RunDate" TIMESTAMP_NTZ
);

-- Intelligent Agent Run Users
-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "IntelligentAgentRunUsers" (
    "AgentId" BIGINT,
    "AgentRunId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "ActionTypeName" VARCHAR(50),
    "ActionHasError" BOOLEAN,
    "ActionHasInfo" BOOLEAN,
    "ActionHasWarning" BOOLEAN,
    "ShouldRetry" BOOLEAN
);

-- JIT Provisioned Users Log
-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "JITProvisionedUsersLog" (
    "UserId" INT,
    "MappingField" VARCHAR(32),
    "MappingFieldValue" VARCHAR(270),
    "ProviderType" VARCHAR(32),
    "ProviderId" VARCHAR(1024),
    "RoleId" INT,
    "Timestamp" TIMESTAMP_NTZ,
    "Action" VARCHAR(16)
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LocalAuthenticationSecurityLog" (
    "UserId" INT,
    "Action" VARCHAR(70),
    "ModifiedBy" INT,
    "ModifiedDate" TIMESTAMP_NTZ
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageDeploymentAudit" (
    "Action" VARCHAR(10),
    "DeploymentID" VARCHAR(36),
    "ClientID" VARCHAR(36),
    "DeploymentName" VARCHAR(200),
    "IsDeploymentEnabled" BOOLEAN,
    "HasAssignmentsAndGrades" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoles" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "HasContextCopy" BOOLEAN,
    "ModifiedBy" BIGINT,
    "Anonymous" BOOLEAN,
    "PreProvisioningEnabled" BOOLEAN,
    "SendOrgUnitInfo" BOOLEAN,
    "SendUserFirstName" BOOLEAN,
    "SendUserMiddleName" BOOLEAN,
    "SendUserLastName" BOOLEAN,
    "SendUserEmail" BOOLEAN,
    "SendBrightspaceUserID" BOOLEAN,
    "SendBrightspaceUsername" BOOLEAN,
    "SendBrightspaceOrgDefinedId" BOOLEAN,
    "SendLinkTitle" BOOLEAN,
    "SendLinkDescription" BOOLEAN,
    "OpenAsExternal" BOOLEAN,
    "AutoMigrateLinks" BOOLEAN,
    "IsSharedToManyOrgUnits" BOOLEAN,
    "AutoCreateGrades" BOOLEAN,
    "IncludeInFinalGrade" BOOLEAN,
    "Timestamp" TIMESTAMP_NTZ,
    "HasAssetProcessor" BOOLEAN
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" VARCHAR(10),
    "ClientId" VARCHAR(255),
    "ToolName" VARCHAR(200),
    "Domain" VARCHAR(2083),
    "RedirectURLs" VARCHAR(2083),
    "KeysetURL" VARCHAR(255),
    "LoginURL" VARCHAR(255),
    "LTIVersion" VARCHAR(12),
    "IsRegistrationEnabled" BOOLEAN,
    "SendInstitutionRole" BOOLEAN,
    "TargetLinkURI" VARCHAR(255),
    "ModifiedBy" BIGINT,
    "HasAssignmentAndGradeServices" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoleProvisioningServices" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "Timestamp" TIMESTAMP_NTZ,
    "HasAssetProcessor" BOOLEAN
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" VARCHAR(36),
    "UserId" INT,
    "IMSRoleNames" VARCHAR(10000),
    "ImpersonatingUserId" BIGINT,
    "ImpersonatingUserIMSRoleNames" VARCHAR(10000),
    "LaunchDate" TIMESTAMP_NTZ,
    "OrgUnitId" BIGINT,
    "LTILinkId" BIGINT,
    "DeploymentId" VARCHAR(36),
    "ClientId" VARCHAR(36),
    "ToolProviderId" VARCHAR(300),
    "ContentTopicId" BIGINT,
    "ParentModuleId" BIGINT,
    "Placement" VARCHAR(10),
    "MessageVersion" VARCHAR(10),
    "RequestType" VARCHAR(30)
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTILinkMigrationAudit" (
    "LTIMigrationId" VARCHAR(36),
    "UserId" BIGINT,
    "MigrationDate" TIMESTAMP_NTZ,
    "OrgUnitId" BIGINT,
    "LinkId" BIGINT,
    "LinkURL" VARCHAR(2000),
    "LinkName" VARCHAR(200),
    "ClientId" VARCHAR(255),
    "RegistrationDomain" VARCHAR(2083),
    "DeploymentId" VARCHAR(36),
    "JobId" BIGINT,
    "Status" SMALLINT,
    "FailureCode" SMALLINT,
    "MigrationType" SMALLINT,
    "LegacyURL" VARCHAR(2083)
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "LTILinks" (
    "LtiLinkId" BIGINT,
    "OrgUnitId" INT,
    "Title" VARCHAR(200),
    "LinkType" INT,
    "LTIVersion" VARCHAR(12),
    "Url" VARCHAR(2000),
    "Description" VARCHAR(1000),
    "IsVisible" BOOLEAN,
    "SendTCInfo" BOOLEAN,
    "SendContextInfo" BOOLEAN,
    "SendCourseInfo" BOOLEAN,
    "SendOrgUnitInfo" BOOLEAN,
    "SendUserId" BOOLEAN,
    "SendUserName" BOOLEAN,
    "SendUserEmail" BOOLEAN,
    "SendLinkTitle" BOOLEAN,
    "SendLinkDescription" BOOLEAN,
    "SendD2LUserName" BOOLEAN,
    "SendD2LOrgDefinedId" BOOLEAN,
    "SendD2LOrgRoleId" BOOLEAN,
    "SendBrightspaceUserId" BOOLEAN,
    "Anonymous" BOOLEAN,
    "Shared" BOOLEAN,
    "UseToolProviderSecuritySettings" BOOLEAN,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "OuAvailabilitySetId" BIGINT,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "DeploymentId" VARCHAR(36),
    "LinkSubType" INT
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "MediaConsumptionLog" (
    "LogId" VARCHAR(36),
    "UserId" INT,
    "ContentId" VARCHAR(36),
    "RevisionId" VARCHAR(36),
    "ContentType" VARCHAR(5),
    "ClientApp" VARCHAR(32),
    "DateConsumed" TIMESTAMP_NTZ,
    "DurationPercentageWatched" INT
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "MediaObjects" (
    "ContentId" VARCHAR(36),
    "Title" VARCHAR(1000),
    "RevisionCount" INT,
    "OwnerId" INT,
    "LastModified" TIMESTAMP_NTZ
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitAncestors" (
    "OrgUnitId" INT,
    "AncestorOrgUnitId" INT,
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitDescendants" (
    "OrgUnitId" INT,
    "DescendantOrgUnitId" INT,
    "LastModified" TIMESTAMP_NTZ,
    "DateDeleted" TIMESTAMP_NTZ
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitParents" (
    "OrgUnitId" INT,
    "ParentOrgUnitId" INT,
    "RowVersion" BIGINT,
    "DateDeleted" TIMESTAMP_NTZ
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitRecentAccess" (
    "OrgUnitId" INT,
    "UserId" INT,
    "LastAccessedDate" TIMESTAMP_NTZ
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "OrganizationalUnits" (
    "OrgUnitId" INT,
    "Organization" VARCHAR(50),
    "Type" VARCHAR(50),
    "Name" VARCHAR(128),
    "Code" VARCHAR(50),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsActive" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "RecycledDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "OrgUnitTypeId" INT
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomeDetails" (
    "OutcomeId" VARCHAR(36),
    "OutcomeDefinitionSource" VARCHAR(1000),
    "OutcomeDefinitionId" VARCHAR(128),
    "ParentOutcomeId" VARCHAR(36),
    "Description" VARCHAR(1000),
    "Notation" VARCHAR(1000),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesAlignedToToolObjects" (
    "ObjectType" INT,
    "ObjectId" VARCHAR(255),
    "OutcomeId" VARCHAR(36),
    "RegistryId" VARCHAR(36),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "AIUtilization" INT
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS "OutcomesAssessedCheckpoints" (
    "CheckpointId" VARCHAR(36),
    "DemonstrationId" VARCHAR(36),
    "Feedback" VARCHAR(1000),
    "ConfigDecayRate" INT,
    "ConfigAggregationMethod" INT,
    "ConfigIncludedActivities" INT,
    "ConfigMultipleAttemptStrategy" INT,
    "ConfigRecentlyAssessedActivityCount" INT,
    "ConfigTieBreaker" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "HasMetAchievementThreshold" BOOLEAN,
    "AchievedLevelId" VARCHAR(36)
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesCourseSpecificScales" (
    "OrgUnitId" INT,
    "RegistryId" VARCHAR(36),
    "ScaleId" VARCHAR(36),
    "AchievementThreshold" VARCHAR(36),
    "CreatedDate" TIMESTAMP_NTZ,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesDemonstrations" (
    "DemonstrationId" VARCHAR(36),
    "ExplicitlyEnteredScaleLevelId" VARCHAR(36),
    "AutomaticallyGeneratedScaleLevelId" VARCHAR(36),
    "AlignedObjectType" INT,
    "AlignedObjectId" VARCHAR(1000),
    "OutcomeId" VARCHAR(36),
    "RegistryId" VARCHAR(36),
    "IsPublished" BOOLEAN,
    "AssessedUserId" INT,
    "AssessedDate" TIMESTAMP_NTZ,
    "AssessorUserId" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
CREATE TABLE IF NOT EXISTS "OutcomesInRegistries" (
    "OutcomeId" VARCHAR(36),
    "RegistryId" VARCHAR(36),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Outcomes Rubric Alignments
-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
CREATE TABLE IF NOT EXISTS "OutcomesRubricAlignments" (
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "OutcomeId" VARCHAR(36),
    "RegistryId" VARCHAR(36),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesScaleDefinition" (
    "ScaleId" VARCHAR(36),
    "Name" VARCHAR(1000),
    "IsDefault" BOOLEAN,
    "UsePercentages" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "AchievementThreshold" VARCHAR(36)
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesScaleLevelDefinition" (
    "ScaleLevelId" VARCHAR(36),
    "ScaleId" VARCHAR(36),
    "Name" VARCHAR(1000),
    "SortOrder" INT,
    "PercentageRangeStart" INT,
    "RGB" VARCHAR(40),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetCourse" (
    "RegistryId" VARCHAR(36),
    "OrgUnitId" BIGINT,
    "SourceOutcomeSetId" BIGINT,
    "IsPrimary" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "ScaleId" VARCHAR(36),
    "AchievementThreshold" VARCHAR(36)
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetOrg" (
    "OutcomeSetId" BIGINT,
    "OutcomeSetName" VARCHAR(256),
    "RegistryId" VARCHAR(36),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "ScaleId" VARCHAR(36)
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioCategories" (
    "CategoryId" VARCHAR(36),
    "OrgUnitId" INT,
    "Name" VARCHAR(256),
    "IsRetired" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceCategories" (
    "CategoryId" VARCHAR(36),
    "EvidenceId" VARCHAR(36),
    "Group" VARCHAR(30),
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceLog" (
    "LogId" VARCHAR(36),
    "ParentObjectId" VARCHAR(36),
    "ObjectId" VARCHAR(36),
    "ObjectType" VARCHAR(40),
    "UserId" INT,
    "OrgUnitId" INT,
    "Action" VARCHAR(16),
    "IsMobile" BOOLEAN,
    "ActionDate" TIMESTAMP_NTZ
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceObjects" (
    "EvidenceId" VARCHAR(36),
    "OwnerId" INT,
    "OrgUnitId" INT,
    "EvidenceType" VARCHAR(30),
    "Title" VARCHAR(1000),
    "IsApproved" BOOLEAN,
    "IsSpotlighted" BOOLEAN,
    "IsSharedToParents" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "IsRecoverableByInstructor" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsSharedWithInstructor" BOOLEAN,
    "DateSharedWithInstructor" TIMESTAMP_NTZ
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PreRequisiteConditionsMet" (
    "PreRequisiteId" INT,
    "UserId" INT,
    "DateMet" TIMESTAMP_NTZ,
    "Action" VARCHAR(7),
    "LastModified" TIMESTAMP_NTZ
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswerOptions" (
    "AnswerId" BIGINT,
    "AnswerText" VARCHAR(1000),
    "Weight" NUMBER(19,9),
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerOptionId" INT
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswers" (
    "AnswerId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "SortOrder" INT,
    "Weight" NUMBER(19,9),
    "Answer" VARCHAR(1000),
    "Comment" VARCHAR(1000),
    "Description" VARCHAR(256)
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionLibrary" (
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "IsAutoGraded" BOOLEAN,
    "TemplateTypeId" INT,
    "QuestionType" VARCHAR(28),
    "Name" VARCHAR(256),
    "Question" VARCHAR(1000),
    "Comment" VARCHAR(1000),
    "AnswerKey" VARCHAR(1000),
    "CreationDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "AllowsAttachments" BOOLEAN,
    "AIUtilization" INT
);

-- Question Pools
-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionPools" (
    "SectionId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Question Relationships
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionRelationships" (
    "CollectionId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "Order" BIGINT,
    "SectionId" BIGINT,
    "IsQuestionPool" BOOLEAN,
    "CreationDate" TIMESTAMP_NTZ,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" BIGINT,
    "Points" NUMBER(19,9),
    "Difficulty" INT,
    "IsBonus" BOOLEAN,
    "IsMandatory" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT,
    "ObjectId" BIGINT
);

-- Quiz Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttempts" (
    "AttemptId" BIGINT,
    "QuizId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "AttemptNumber" INT,
    "TimeStarted" TIMESTAMP_NTZ,
    "TimeCompleted" TIMESTAMP_NTZ,
    "Score" NUMBER(19,9),
    "IsGraded" BOOLEAN,
    "OldAttemptNumber" INT,
    "IsDeleted" BOOLEAN,
    "PossibleScore" NUMBER(19,9),
    "IsRetakeIncorrectOnly" BOOLEAN,
    "DueDate" TIMESTAMP_NTZ,
    "TimeLimit" INT,
    "TimeLimitEnforced" BOOLEAN,
    "TimeLimitExceededBehaviour" VARCHAR(128),
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INT,
    "Version" BIGINT
);

-- Quiz Attempts Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttemptsLog" (
    "LogId" BIGINT,
    "AttemptId" BIGINT,
    "EventTypeId" INT,
    "Name" VARCHAR(256),
    "Description" VARCHAR(256),
    "EventTime" TIMESTAMP_NTZ,
    "IPAddress" VARCHAR(45),
    "UserId" INT,
    "IsDeleted" BOOLEAN
);

-- Quiz Objects
-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "QuizObjects" (
    "QuizId" BIGINT,
    "QuizName" VARCHAR(256),
    "QuizDescription" VARCHAR(1000),
    "QuizCategory" VARCHAR(256),
    "IsActive" BOOLEAN,
    "OrgUnitId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DueDate" TIMESTAMP_NTZ,
    "CreationDate" TIMESTAMP_NTZ,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" BIGINT,
    "GradeObjectId" BIGINT,
    "OverallScoreCalculation" VARCHAR(23),
    "QuizScoreDenominator" NUMBER(19,9),
    "HasPassword" BOOLEAN,
    "IPRestricted" BOOLEAN,
    "TimeLimit" INT,
    "TimeLimitEnforced" BOOLEAN,
    "AttemptsAllowed" INT,
    "PreventMovingBackwards" BOOLEAN,
    "AllowHints" BOOLEAN,
    "NotificationEmail" VARCHAR(1000),
    "DisablePagerAccess" BOOLEAN,
    "DisplayInCalendar" BOOLEAN,
    "IsAttemptRldb" BOOLEAN,
    "IsSubviewRldb" BOOLEAN,
    "SortOrder" INT,
    "CategoryId" BIGINT,
    "ResultId" BIGINT,
    "IsRetakeIncorrectOnly" BOOLEAN,
    "PagingTypeId" INT,
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INT,
    "AIStudySupport" BOOLEAN,
    "HideQuestionPoints" BOOLEAN,
    "IsSingleSession" BOOLEAN,
    "HideAnnotationTools" BOOLEAN
);

-- Quiz Survey Sections
-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizSurveySections" (
    "CollectionId" BIGINT,
    "SectionId" BIGINT,
    "Name" VARCHAR(256),
    "NameIsDisplayed" BOOLEAN,
    "IsQuestionPool" BOOLEAN,
    "SectionText" VARCHAR(1000),
    "SectionTextIsHTML" BOOLEAN,
    "IsSectionTextHidden" BOOLEAN,
    "QuestionPoints" NUMBER(19,9),
    "NumQuestions" INT,
    "NumChoices" INT,
    "Shuffle" BOOLEAN,
    "CreationDate" TIMESTAMP_NTZ,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Quiz User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "QuizUserAnswerResponses" (
    "AttemptId" BIGINT,
    "AttemptNumber" INT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerId" BIGINT,
    "SortOrder" INT,
    "IsCorrect" BOOLEAN,
    "UserSelection" BIGINT,
    "UserAnswer" VARCHAR(1000),
    "FileSetId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN
);

-- Quiz User Answers
-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS "QuizUserAnswers" (
    "AttemptId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "TimeCompleted" TIMESTAMP_NTZ,
    "QuestionNumber" INT,
    "Comment" VARCHAR(1000),
    "SortOrder" INT,
    "Score" NUMBER(19,9),
    "Page" INT,
    "SectionId" BIGINT,
    "ObjectId" BIGINT,
    "OutOf" NUMBER(19,9),
    "TimeStarted" TIMESTAMP_NTZ,
    "IsBonus" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "QuizTimeCompleted" TIMESTAMP_NTZ
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ReleaseConditionObjects" (
    "PreRequisiteId" INT,
    "ResultId" INT,
    "OrgUnitId" INT,
    "Name" VARCHAR(64),
    "IsNegativeCondition" BOOLEAN,
    "PreRequisiteToolId" INT,
    "Id1" INT,
    "Id2" INT,
    "ResultToolId" INT,
    "UsesPercentage" BOOLEAN,
    "OperatorTypeDesc" VARCHAR(3),
    "Version" BIGINT,
    "Guid1" VARCHAR(36),
    "Guid2" VARCHAR(36)
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReleaseConditionResults" (
    "ResultId" INT,
    "UserId" INT,
    "Met" VARCHAR(7),
    "Version" BIGINT,
    "DeletedDate" TIMESTAMP_NTZ
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReofferCourse" (
    "CourseOfferingId" INT,
    "SourceCourseId" INT,
    "CreatedBy" INT,
    "ReofferDate" TIMESTAMP_NTZ
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "RoleDetails" (
    "RoleId" INT,
    "RoleName" VARCHAR(120),
    "Description" VARCHAR(400),
    "IsCascading" BOOLEAN,
    "InClassList" BOOLEAN,
    "ClassListRoleName" VARCHAR(120),
    "ClassListShowGroups" BOOLEAN,
    "ClassListShowSections" BOOLEAN,
    "ClassListDisplayRole" BOOLEAN,
    "AccessInactiveCO" BOOLEAN,
    "HasSpecialAccess" BOOLEAN,
    "AddToCourseOfferingGroups" BOOLEAN,
    "CanBeAutoEnrolledIntoGroups" BOOLEAN,
    "AddToCourseOfferingSections" BOOLEAN,
    "CanBeAutoEnrolledIntoSections" BOOLEAN,
    "AccessPastCourses" BOOLEAN,
    "AccessFutureCourses" BOOLEAN,
    "SortOrder" INT,
    "ShowInContent" BOOLEAN,
    "ShowInDiscussionAssess" BOOLEAN,
    "ShowInDiscussionStats" BOOLEAN,
    "ShowInGrades" BOOLEAN,
    "ShowInAttendance" BOOLEAN,
    "AllowSelfEnrollInGroups" BOOLEAN,
    "ShowInRegistration" BOOLEAN,
    "ShowInUserProgress" BOOLEAN,
    "RoleAlias" VARCHAR(120),
    "RoleCode" VARCHAR(100),
    "LastModifiedDate" TIMESTAMP_NTZ,
    "DeletedBy" INT
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "RubricAssessment" (
    "RubricId" BIGINT,
    "OrgUnitId" INT,
    "UserId" INT,
    "Score" NUMBER(36,2),
    "AssessedByUserId" INT,
    "AssessmentDate" TIMESTAMP_NTZ,
    "IsCompleted" BOOLEAN,
    "ActivityType" VARCHAR(50),
    "ActivityObjectId" BIGINT,
    "DateCreated" TIMESTAMP_NTZ,
    "AssessmentId" BIGINT,
    "LevelAchievedId" BIGINT,
    "ActivityId" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Rubric Assessment Criteria
-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricAssessmentCriteria" (
    "AssessmentId" BIGINT,
    "RubricId" BIGINT,
    "Score" NUMBER(19,9),
    "Feedback" VARCHAR(4000),
    "IsScoreOverridden" BOOLEAN,
    "CriterionId" BIGINT,
    "LevelAchievedId" BIGINT,
    "Version" BIGINT
);

-- Rubric Criteria Levels
-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "RubricCriteriaLevels" (
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "Description" VARCHAR(1000),
    "Feedback" VARCHAR(1000),
    "Value" NUMBER(19,9),
    "LevelId" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Rubric Object Criteria
-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectCriteria" (
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "Name" VARCHAR(500),
    "SortOrder" INT,
    "CriteriaGroupId" BIGINT,
    "GroupName" VARCHAR(256),
    "GroupSortOrder" INT,
    "LevelSetId" BIGINT,
    "IsDeleted" BOOLEAN
);

-- Rubric Object Levels
-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectLevels" (
    "RubricId" BIGINT,
    "LevelId" BIGINT,
    "Name" VARCHAR(256),
    "Description" VARCHAR(1000),
    "Feedback" VARCHAR(1000),
    "Value" NUMBER(19,9),
    "RangeStartValue" NUMBER(19,9),
    "SortOrder" INT,
    "LevelSetId" BIGINT,
    "IsDeleted" BOOLEAN
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "RubricObjects" (
    "RubricId" BIGINT,
    "Name" VARCHAR(256),
    "RubricStatus" VARCHAR(256),
    "Description" VARCHAR(1000),
    "RubricType" VARCHAR(256),
    "ScoringMethods" VARCHAR(256),
    "IsScoreVisible" BOOLEAN,
    "OrgUnitID" INT,
    "IsShared" BOOLEAN,
    "IsDeleted" BOOLEAN
);

-- Rubrics Edit
-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricsEdit" (
    "AuditLogId" VARCHAR(36),
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "LevelId" BIGINT,
    "ModifiedBy" INT,
    "ModifiedObjectType" INT,
    "CriteriaGroupId" BIGINT,
    "ModifiedDate" TIMESTAMP_NTZ,
    "PreviousValue" VARCHAR(4000),
    "ModifiedValue" VARCHAR(4000),
    "IsLocked" BOOLEAN,
    "Version" INT
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMActivities" (
    "ActivityId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "ParentActivityId" VARCHAR(36),
    "NumChildren" INT,
    "InternalId" VARCHAR(255),
    "Title" VARCHAR(200),
    "CompletionThreshold" FLOAT,
    "PassingScore" FLOAT,
    "PassingScoreUsed" BOOLEAN,
    "ScoreMin" FLOAT,
    "ScoreMax" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMActivityAttempts" (
    "VisitId" VARCHAR(36),
    "ActivityId" VARCHAR(36),
    "AttemptNumber" INT,
    "Completion" VARCHAR(100),
    "Success" VARCHAR(100),
    "Score" FLOAT,
    "ScoreRaw" FLOAT,
    "TimeSpent" FLOAT,
    "Progress" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMInteractionAttempts" (
    "VisitId" VARCHAR(36),
    "InteractionId" VARCHAR(36),
    "AttemptNumber" INT,
    "ActivityId" VARCHAR(36),
    "Timestamp" TIMESTAMP_NTZ,
    "Response" VARCHAR(1000),
    "Result" VARCHAR(100),
    "NumericResult" FLOAT,
    "TimeSpent" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS "SCORMInteractionObjectives" (
    "InteractionId" VARCHAR(36),
    "ObjectiveId" VARCHAR(36),
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS "SCORMInteractions" (
    "InteractionId" VARCHAR(36),
    "ActivityId" VARCHAR(36),
    "InternalId" VARCHAR(255),
    "InteractionType" VARCHAR(100),
    "Description" VARCHAR(250),
    "Weighting" FLOAT,
    "CorrectResponses" VARCHAR(2000),
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMObjectiveAttempts" (
    "VisitId" VARCHAR(36),
    "ObjectiveId" VARCHAR(36),
    "AttemptNumber" INT,
    "Score" FLOAT,
    "ScoreRaw" FLOAT,
    "Success" VARCHAR(100),
    "Completion" VARCHAR(100),
    "Progress" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMObjectives" (
    "ObjectiveId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "ObjectiveType" VARCHAR(100),
    "ActivityId" VARCHAR(36),
    "InternalId" VARCHAR(255),
    "IsPrimary" BOOLEAN,
    "Description" VARCHAR(250),
    "ScoreMin" FLOAT,
    "ScoreMax" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SCORMObjects" (
    "ScormObjectId" VARCHAR(36),
    "OrgUnitId" INT,
    "ContentObjectId" INT,
    "ContentServiceContentId" VARCHAR(36),
    "ContentServiceRevisionId" VARCHAR(36),
    "ContentServiceTopicId" VARCHAR(36),
    "Title" VARCHAR(1000),
    "Description" VARCHAR(1000),
    "LearningStandard" VARCHAR(100),
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SCORMVisits" (
    "VisitId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "UserId" INT,
    "OrgUnitId" INT,
    "FirstAccessDate" TIMESTAMP_NTZ,
    "LastAccessDate" TIMESTAMP_NTZ,
    "CompletedDate" TIMESTAMP_NTZ,
    "Completion" VARCHAR(100),
    "Success" VARCHAR(100),
    "Score" FLOAT,
    "TimeSpent" INT,
    "Progress" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SessionHistory" (
    "SessionId" BIGINT,
    "OrgId" INT,
    "UserId" INT,
    "DateStarted" TIMESTAMP_NTZ,
    "DateEnded" TIMESTAMP_NTZ,
    "LastAccessed" TIMESTAMP_NTZ,
    "TimedOut" BOOLEAN,
    "HistoryID" BIGINT
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SISCourseMergeLog" (
    "BatchId" VARCHAR(36),
    "JobType" VARCHAR(32),
    "Status" VARCHAR(32),
    "OriginalTargetOrgUnitId" BIGINT,
    "OriginalSourceOrgUnitId" BIGINT,
    "SourceSystemId" BIGINT,
    "NumberOfCoursesInBatch" INT,
    "UserId" BIGINT,
    "ErrorType" VARCHAR(48),
    "Timestamp" TIMESTAMP_NTZ
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SourceCourseDeployHistory" (
    "SourceCourseDeployId" BIGINT,
    "SourceCourseOrgUnitId" INT,
    "TargetCourseOrgUnitId" INT,
    "UserId" INT,
    "Status" VARCHAR(128),
    "QueuedTime" TIMESTAMP_NTZ,
    "CompletionTime" TIMESTAMP_NTZ
);

-- Survey Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyAttempts" (
    "AttemptId" BIGINT,
    "SurveyId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "AttemptNumber" INT,
    "TimeStarted" TIMESTAMP_NTZ,
    "TimeCompleted" TIMESTAMP_NTZ,
    "AttemptedFromOrgUnitId" INT,
    "OldAttemptNumber" INT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Survey Objects
-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SurveyObjects" (
    "SurveyId" BIGINT,
    "SurveyName" VARCHAR(1000),
    "CategoryId" BIGINT,
    "OrgUnitId" INT,
    "Description" VARCHAR(1000),
    "DescriptionEnabled" BOOLEAN,
    "HasInstantFeedback" BOOLEAN,
    "IsAnonymous" BOOLEAN,
    "IsVisible" BOOLEAN,
    "SubmissionMessage" VARCHAR(1000),
    "Footer" VARCHAR(1000),
    "FooterIsDisplayed" BOOLEAN,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "DisplayInCalendar" BOOLEAN,
    "ResultId" BIGINT,
    "AttemptsAllowed" INT,
    "SortOrder" INT,
    "CreatedBy" INT,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "Version" BIGINT,
    "CategoryName" VARCHAR(256)
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswerResponses" (
    "AttemptId" BIGINT,
    "AttemptNumber" INT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerId" BIGINT,
    "SortOrder" BIGINT,
    "IsCorrect" BOOLEAN,
    "UserSelection" BIGINT,
    "UserAnswer" VARCHAR(1000),
    "FileSetId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "IsDeleted" BOOLEAN
);

-- Survey User Answers
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswers" (
    "AttemptId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "TimeCompleted" TIMESTAMP_NTZ,
    "QuestionNumber" INT,
    "Comment" VARCHAR(1000),
    "SortOrder" INT,
    "Score" NUMBER(19,9),
    "Page" INT,
    "Assigned" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "SurveyTimeCompleted" TIMESTAMP_NTZ
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessLog" (
    "SessionId" VARCHAR(36),
    "UserId" INT,
    "Timestamp" TIMESTAMP_NTZ,
    "State" VARCHAR(20),
    "Source" VARCHAR(20),
    "AppVersion" VARCHAR(20),
    "Device" VARCHAR(50),
    "IsOfflineMode" BOOLEAN,
    "IPAddress" VARCHAR(45)
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessSummary" (
    "UserId" INT,
    "ImpersonatingUserId" INT,
    "LastSystemAccess" TIMESTAMP_NTZ,
    "Source" VARCHAR(20)
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Tools" (
    "ToolId" INT,
    "Name" VARCHAR(50),
    "DisplayName" VARCHAR(200),
    "Version" BIGINT
);

-- TurnItIn Submissions
-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS "TurnItInSubmissions" (
    "DropboxId" BIGINT,
    "SubmissionId" BIGINT,
    "FileId" BIGINT,
    "LastSubmissionDate" TIMESTAMP_NTZ,
    "SubmissionStatus" SMALLINT,
    "SubmissionErrorType" SMALLINT,
    "ErrorMessage" VARCHAR(255),
    "SubmittedBy" INT,
    "LastRefreshDate" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ
);

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserAttributeDefinitions" (
    "AttributeId" VARCHAR(128),
    "Name" VARCHAR(128),
    "Type" VARCHAR(8),
    "AllowMultiple" BOOLEAN,
    "IsDefault" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "ModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- User Attribute Values
-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserAttributeValues" (
    "UserId" INT,
    "AttributeId" VARCHAR(128),
    "Value" VARCHAR(4000),
    "LastModified" TIMESTAMP_NTZ,
    "ModifiedBy" INT,
    "IsDeleted" BOOLEAN,
    "Version" INT
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserEnrollments" (
    "OrgUnitId" INT,
    "UserId" INT,
    "RoleName" VARCHAR(60),
    "EnrollmentDate" TIMESTAMP_NTZ,
    "EnrollmentType" VARCHAR(50),
    "RoleId" INT
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserLogins" (
    "UserId" INT,
    "UserName" VARCHAR(256),
    "IP" VARCHAR(64),
    "SessionId" INT,
    "StatusType" VARCHAR(50),
    "AttemptDate" TIMESTAMP_NTZ,
    "ImpersonatingUserId" INT,
    "LoginAttemptId" VARCHAR(36),
    "LoginSource" VARCHAR(50)
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" INT,
    "UserName" VARCHAR(270),
    "OrgDefinedId" VARCHAR(256),
    "FirstName" VARCHAR(64),
    "MiddleName" VARCHAR(64),
    "LastName" VARCHAR(64),
    "IsActive" BOOLEAN,
    "ExternalEmail" VARCHAR(256),
    "CreationDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "OrgRoleId" INT,
    "DateDeleted" TIMESTAMP_NTZ
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" INT,
    "CourseName" VARCHAR(255),
    "MeetingId" VARCHAR(36),
    "MeetingName" VARCHAR(255),
    "CreationUserId" INT,
    "CreationDate" TIMESTAMP_NTZ,
    "ScheduledDate" TIMESTAMP_NTZ,
    "ScheduledDuration" INT,
    "IsPublished" BOOLEAN,
    "ExternalLinksEnabled" BOOLEAN,
    "WholeClassInvited" BOOLEAN,
    "IsCancelled" BOOLEAN,
    "StartDateTime" TIMESTAMP_NTZ,
    "EndDateTime" TIMESTAMP_NTZ,
    "IsRecorded" BOOLEAN
);
