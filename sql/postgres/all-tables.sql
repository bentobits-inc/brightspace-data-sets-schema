-- All 144 Brightspace Data Sets tables for Postgres 9.1 or later.
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Accommodations Profile Log
-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AccommodationsProfileLog" (
    "AccommodatedUserId" bigint,
    "OrgUnitId" bigint,
    "QuizTimeLimitMultiplier" numeric(5,2),
    "QuizTimeLimitExtraTime" integer,
    "QuizControlAlwaysAllowRightClick" boolean,
    "ModifiedBy" bigint,
    "LastModified" timestamp
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityExemptionsLog" (
    "OrgUnitId" integer,
    "UserId" integer,
    "ObjectId" integer,
    "ActivityId" varchar(225),
    "LogTypeName" varchar(50),
    "LastModifiedUtc" timestamp,
    "LastModifiedBy" integer,
    "ActivityExemptionsLogId" bigint,
    "ToolId" integer
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentLog" (
    "LogId" uuid,
    "UserId" integer,
    "OrgUnitId" integer,
    "CommentId" uuid,
    "Action" varchar(16),
    "ActionDate" timestamp,
    "Content" varchar(3072),
    "PostId" uuid
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentObjects" (
    "OrgUnitId" integer,
    "CommentId" uuid,
    "LastModifiedBy" integer,
    "LastModified" timestamp,
    "Content" varchar(3072),
    "IsDeleted" boolean,
    "PostId" uuid,
    "Version" bigint
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostLog" (
    "LogId" uuid,
    "UserId" integer,
    "OrgUnitId" integer,
    "PostId" uuid,
    "PostType" varchar(16),
    "Action" varchar(16),
    "ActionDate" timestamp,
    "DropboxId" bigint,
    "Content" varchar(3072),
    "CommentCount" integer,
    "AttachmentCount" integer
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostObjects" (
    "OrgUnitId" integer,
    "PostId" uuid,
    "PostType" varchar(16),
    "LastModifiedBy" integer,
    "LastModified" timestamp,
    "DropboxId" bigint,
    "Content" varchar(3072),
    "IsDeleted" boolean,
    "CommentCount" integer,
    "AttachmentCount" integer,
    "Version" bigint
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AIConsumption" (
    "ConsumptionId" varchar(255),
    "UserId" integer,
    "OrgUnitId" integer,
    "Date" timestamp,
    "GenerationCount" integer,
    "ConsumptionSource" integer
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "Announcements" (
    "AnnouncementId" bigint,
    "OrgUnitId" bigint,
    "Title" varchar(400),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsGlobal" boolean,
    "IsDraft" boolean,
    "NumAttachments" integer,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "CreatedBy" integer,
    "IsAuthorInfoShown" boolean,
    "CreatedDate" timestamp,
    "ResultId" bigint
);

-- Assignment Special Access
-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AssignmentSpecialAccess" (
    "DropboxId" bigint,
    "UserId" integer,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "ModifiedBy" integer,
    "LastModified" timestamp,
    "IsDeleted" boolean,
    "StartDateAvailabilityType" smallint,
    "EndDateAvailabilityType" smallint
);

-- Assignment Submission Details
-- Primary key (informational, not enforced): SubmissionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AssignmentSubmissionDetails" (
    "SubmissionId" bigint,
    "DropboxId" bigint,
    "UserId" bigint,
    "GroupId" bigint,
    "NumberOfFilesSubmitted" integer,
    "TotalFileSize" bigint,
    "SubmittedByUserId" integer,
    "DateSubmitted" timestamp,
    "Comments" varchar(1000),
    "IsTurnItInExempt" boolean,
    "IsDeleted" boolean,
    "IsPreview" boolean,
    "Version" bigint
);

-- Assignment Submissions
-- Primary key (informational, not enforced): DropboxId, SubmitterId, SubmitterType
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSubmissions" (
    "DropboxId" bigint,
    "OrgUnitId" integer,
    "SubmitterId" bigint,
    "SubmitterType" varchar(5),
    "FileSubmissionCount" integer,
    "TotalFileSize" bigint,
    "FeedbackUserId" integer,
    "FeedbackIsRead" boolean,
    "Score" numeric(19,9),
    "IsGraded" boolean,
    "LastSubmissionDate" timestamp,
    "Feedback" varchar(1000),
    "FeedbackLastModified" timestamp,
    "FeedbackReadDate" timestamp,
    "CompletionDate" timestamp,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(128),
    "Category" varchar(128),
    "Type" varchar(10),
    "GradeItemId" bigint,
    "PossibleScore" numeric(19,9),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "IsRestricted" boolean,
    "IsDeleted" boolean,
    "TurnItInEnabled" boolean,
    "IsHidden" boolean,
    "SortOrder" integer,
    "SubmissionType" varchar(18),
    "CompletionType" varchar(27),
    "ResultId" integer,
    "CategoryId" bigint,
    "Version" bigint,
    "StartDateAvailabilityType" smallint,
    "EndDateAvailabilityType" smallint,
    "AIUtilization" integer,
    "Instructions" varchar(10000)
);

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceRegisters" (
    "AttendanceRegisterId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(128),
    "Description" varchar(1000),
    "SchemeId" bigint,
    "IsVisible" boolean,
    "IncludeAllUsers" boolean,
    "CauseForConcern" numeric(19,9),
    "Version" bigint,
    "DateDeleted" timestamp,
    "DeletedBy" integer
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceSchemes" (
    "SchemeId" bigint,
    "OrgUnitId" integer,
    "SchemeName" varchar(128),
    "SchemeSymbolId" bigint,
    "SymbolName" varchar(128),
    "SymbolValue" varchar(50),
    "Percentage" numeric(19,9),
    "Version" bigint,
    "DateDeleted" timestamp,
    "DeletedBy" integer
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
CREATE TABLE IF NOT EXISTS "AttendanceSessions" (
    "AttendanceSessionId" bigint,
    "AttendanceRegisterId" bigint,
    "Name" varchar(128),
    "Description" varchar(256),
    "SortOrder" integer,
    "Version" bigint,
    "DateDeleted" timestamp,
    "DeletedBy" integer
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS "AttendanceUserSessions" (
    "UserId" integer,
    "AttendanceSessionId" bigint,
    "SchemeSymbolId" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS "AudioVideoProcessed" (
    "ContentId" uuid,
    "RevisionId" uuid,
    "RevisionNumber" integer,
    "Type" varchar(5),
    "Source" varchar(32),
    "RevisionSize" bigint,
    "Duration" integer,
    "RequiredTranscoding" boolean,
    "RequiredTranscribing" boolean,
    "LastModified" timestamp
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AuditorRelationshipsLog" (
    "AuditorId" integer,
    "UserToAuditId" integer,
    "OrgUnitId" integer,
    "Action" varchar(16),
    "ModifiedBy" integer,
    "ModifiedDate" timestamp
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "AwardObjects" (
    "AwardId" bigint,
    "Name" varchar(256),
    "AwardTypeId" integer,
    "Type" varchar(128),
    "Description" varchar(512),
    "ExpiryCalculationType" varchar(128),
    "ExpiryNotificationType" varchar(128),
    "ExpiryDate" timestamp,
    "ImagePath" varchar(1000),
    "CreatedByUserId" bigint,
    "LastModified" timestamp,
    "IsDeleted" boolean,
    "Criteria" varchar(1000)
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
    "AwardId" bigint,
    "OrgUnitId" bigint,
    "UserId" bigint,
    "IssuedBy" integer,
    "IssueDate" timestamp,
    "ExpiryDate" timestamp,
    "IssuedId" bigint,
    "Criteria" varchar(1000),
    "Evidence" varchar(1000),
    "RevokedDate" timestamp,
    "RevokedReason" varchar(1000),
    "RevokedBy" bigint,
    "LastModifiedBy" bigint,
    "LastModifiedDate" timestamp,
    "Version" bigint,
    "CertificateId" varchar(12)
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "BrightspaceEmailLog" (
    "MailId" integer,
    "SenderUserId" integer,
    "SenderAddress" varchar(256),
    "RecipientAddress" varchar(256),
    "RecipientType" varchar(4),
    "DateTimeSent" timestamp,
    "Subject" varchar(1000)
);

-- Calendar Events
-- Primary key (informational, not enforced): ScheduleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CalendarEvents" (
    "ScheduleId" bigint,
    "OrgUnitId" bigint,
    "UserId" bigint,
    "Title" varchar(256),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "TimeZoneIdentifier" varchar(256),
    "IsAllDayEvent" boolean,
    "RecurrenceType" varchar(7),
    "RecurrenceInterval" integer,
    "CreatedByUserId" integer,
    "LastModified" timestamp,
    "EventObjectTypeName" varchar(200),
    "ObjectLookupId1" bigint,
    "ObjectLookupId2" bigint
);

-- Checklist Category Details
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ChecklistId -> ChecklistObjects.ChecklistId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCategoryDetails" (
    "CategoryId" bigint,
    "ChecklistId" bigint,
    "Name" varchar(512),
    "Description" varchar(1000),
    "DescriptionIsHtml" boolean,
    "SortOrder" integer,
    "LastModifiedUtc" timestamp,
    "DateDeleted" timestamp,
    "DeletedBy" integer,
    "Version" bigint
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCompletions" (
    "UserId" integer,
    "DateCompleted" timestamp,
    "ItemId" bigint,
    "LastModified" timestamp,
    "IsCompleted" boolean,
    "DateDeleted" timestamp,
    "DeletedBy" integer,
    "Version" bigint
);

-- Checklist Item Details
-- Primary key (informational, not enforced): ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> ChecklistCategoryDetails.CategoryId
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistItemDetails" (
    "ItemId" bigint,
    "CategoryId" bigint,
    "Name" varchar(512),
    "Description" varchar(1000),
    "DescriptionIsHtml" boolean,
    "DueDate" timestamp,
    "ScheduleId" integer,
    "SortOrder" integer,
    "IsAutoChecked" boolean,
    "LastModifiedUtc" timestamp,
    "DateDeleted" timestamp,
    "DeletedBy" integer,
    "Version" bigint
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ChecklistObjects" (
    "ChecklistId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(512),
    "Description" varchar(1000),
    "DescriptionIsHtml" boolean,
    "SharedUserId" integer,
    "DisplayInNewWindow" boolean,
    "SortOrder" integer,
    "Version" bigint,
    "ResultId" integer,
    "DateDeleted" timestamp,
    "DeletedBy" integer
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyActivities" (
    "ActivityId" bigint,
    "OrgUnitId" integer,
    "ActivityName" varchar(256),
    "ActivityTypeId" integer,
    "AssessmentType" varchar(7),
    "ObjectLookupId" bigint,
    "RubricId" bigint,
    "LevelId" bigint,
    "RubricCriterionId" bigint,
    "AssessmentThresholdCriteria" varchar(2),
    "AssessmentThreshold" numeric(19,9),
    "IsAutoEval" boolean,
    "RubricName" varchar(256),
    "RubricLevelRequired" varchar(256),
    "ObjectId" bigint,
    "ActivityType" varchar(50),
    "Version" bigint
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityLog" (
    "ActivityId" bigint,
    "ActivityLogId" bigint,
    "LogTypeId" integer,
    "LogTypeName" varchar(19),
    "LogDateTime" timestamp,
    "ModifiedBy" bigint
);

-- Competency Activity Results
-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityResults" (
    "ActivityId" bigint,
    "OrgUnitId" integer,
    "UserId" integer,
    "LearningObjectId" bigint,
    "IsAchieved" boolean,
    "PercentAchieved" numeric(19,9),
    "RubricScore" numeric(19,9),
    "RubricLevelAchieved" varchar(256),
    "RubricId" bigint,
    "RubricCriterionId" bigint,
    "AchievedDate" timestamp,
    "Version" bigint
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS "CompetencyLog" (
    "CompetencyLogId" bigint,
    "LogTypeId" integer,
    "LogTypeName" varchar(19),
    "ObjectId" bigint,
    "ObjectTypeId" integer,
    "ObjectTypeName" varchar(18),
    "ObjectVersion" integer,
    "LogDateTime" timestamp,
    "ModifiedBy" bigint,
    "IndirectObjectId" bigint,
    "IndirectObjectTypeName" varchar(18),
    "IndirectObjectTypeId" integer,
    "IndirectObjectVersion" integer
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyObjects" (
    "ObjectId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(256),
    "Type" varchar(256),
    "ReadyForEvaluation" boolean,
    "Status" varchar(9),
    "Description" varchar(1000),
    "NeedReevaluation" boolean,
    "ReevaluationIfAchieved" boolean,
    "ReevaluationIfNotAchieved" boolean,
    "AdditionalIdentifier" varchar(512),
    "IsHidden" boolean
);

-- Competency Structure
-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS "CompetencyStructure" (
    "ObjectId" bigint,
    "ParentObjectId" bigint,
    "BaseObjectID" bigint,
    "Depth" integer,
    "EntryTime" integer
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" integer,
    "ContentObjectId" integer,
    "Action" varchar(10),
    "FilePath" varchar(10000),
    "FileName" varchar(512),
    "FileExtension" varchar(512),
    "FileSizeBytes" bigint,
    "UploadDate" timestamp,
    "LastModifiedBy" integer,
    "LastModified" timestamp
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS "ContentObjects" (
    "ContentObjectId" integer,
    "OrgUnitId" integer,
    "Title" varchar(150),
    "ContentObjectType" varchar(6),
    "CompletionType" varchar(7),
    "ParentContentObjectId" integer,
    "Location" varchar(1024),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "ObjectId1" integer,
    "ObjectId2" integer,
    "ObjectId3" integer,
    "LastModified" timestamp,
    "IsDeleted" boolean,
    "SortOrder" integer,
    "Depth" integer,
    "ToolId" integer,
    "IsHidden" boolean,
    "ResultId" integer,
    "DeletedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedBy" integer,
    "DeletedBy" integer,
    "AIUtilization" integer,
    "Version" bigint
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserCompletion" (
    "ContentObjectId" integer,
    "OrgUnitId" integer,
    "UserId" integer,
    "DateCompleted" timestamp,
    "LastModified" timestamp,
    "Version" bigint,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "AutomaticDateCompleted" timestamp,
    "ManualDateCompleted" timestamp
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserProgress" (
    "ContentObjectId" integer,
    "UserId" integer,
    "CompletedDate" timestamp,
    "LastVisited" timestamp,
    "IsRead" boolean,
    "NumRealVisits" integer,
    "NumFakeVisits" integer,
    "TotalTime" bigint,
    "IsVisited" boolean,
    "IsCurrentBookmark" boolean,
    "IsSelfAssessComplete" boolean,
    "LastModified" timestamp,
    "Version" bigint
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccess" (
    "OrgUnitId" integer,
    "UserId" integer,
    "DayAccessed" timestamp
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccessLog" (
    "OrgUnitId" integer,
    "UserId" integer,
    "Timestamp" timestamp,
    "Source" varchar(20)
);

-- Course Awards
-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CourseAwards" (
    "AssociationId" bigint,
    "AwardId" bigint,
    "OrgUnitId" bigint,
    "DateCreated" timestamp,
    "HiddenAward" boolean,
    "ConditionSetId" bigint,
    "LastModified" timestamp,
    "Credits" numeric(9,2),
    "IsAssociated" boolean,
    "Version" bigint
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseCopyLogs" (
    "SourceOrgUnitId" integer,
    "DestinationOrgUnitId" integer,
    "UserId" bigint,
    "Status" varchar(128),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsDestinationNew" boolean,
    "CopyProtectedResources" boolean,
    "CopyCourseJobId" bigint,
    "StatusId" integer
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CoursePublisherLaunches" (
    "LaunchId" uuid,
    "OrgUnitId" integer,
    "RecipientId" uuid,
    "UserId" integer,
    "RoleId" integer,
    "LaunchMethod" varchar(256),
    "ExternalUserId" varchar(256),
    "ExternalLMSType" varchar(256),
    "IsNewUser" boolean,
    "LastModified" timestamp
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CoursePublisherRecipients" (
    "RecipientID" uuid,
    "Name" varchar(256),
    "CreatedAt" timestamp,
    "LastModified" timestamp
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDCategories" (
    "CategoryId" integer,
    "Name" varchar(256),
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS "CPDJobTargets" (
    "PrincipalId" integer,
    "CategoryId" integer,
    "JobTitle" varchar(256),
    "StructuredMinutes" integer,
    "UnstructuredMinutes" integer,
    "StructuredRecordCount" integer,
    "UnstructuredRecordCount" integer,
    "StartDate" timestamp,
    "DateDeleted" timestamp,
    "LastModified" timestamp,
    "Version" bigint
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDMethods" (
    "MethodId" integer,
    "Name" varchar(4000),
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDQuestionAnswers" (
    "AnswerId" integer,
    "AnswerText" varchar(4000),
    "QuestionId" integer,
    "RecordId" integer,
    "UserId" integer,
    "Action" varchar(16),
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDQuestions" (
    "QuestionId" integer,
    "QuestionText" varchar(4000),
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserRecords" (
    "RecordId" integer,
    "RecordName" varchar(256),
    "State" varchar(50),
    "UserId" integer,
    "Category" integer,
    "Method" integer,
    "CreditMinutes" integer,
    "Evidence" varchar(4000),
    "Type" varchar(50),
    "Grade" numeric(4,3),
    "DateCompleted" timestamp,
    "LastModified" timestamp,
    "DateDeleted" timestamp,
    "Version" bigint
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserTargets" (
    "PrincipalId" integer,
    "CategoryId" integer,
    "UserId" integer,
    "StructuredMinutes" integer,
    "UnstructuredMinutes" integer,
    "StructuredRecordCount" integer,
    "UnstructuredRecordCount" integer,
    "StartDate" timestamp,
    "DateDeleted" timestamp,
    "LastModified" timestamp,
    "Version" bigint
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CreatorPracticesAdoption" (
    "ActivityInstanceId" integer,
    "CreatedById" integer,
    "OrgUnitId" integer,
    "PracticeType" varchar(32),
    "PracticeTitle" varchar(255),
    "ProviderObjectId" integer,
    "CreatedDate" timestamp,
    "Version" bigint
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CreatorPracticesEngagement" (
    "PracticeEngagementId" integer,
    "UserId" integer,
    "OrgUnitId" integer,
    "CompletionStatus" varchar(10),
    "ActivityInstanceId" integer,
    "CompletionDate" timestamp,
    "Version" bigint
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionForums" (
    "OrgUnitId" integer,
    "ForumId" bigint,
    "Name" varchar(400),
    "Description" varchar(1000),
    "MustPostToParticipate" boolean,
    "AllowAnon" boolean,
    "IsHidden" boolean,
    "RequiresApproval" boolean,
    "SortOrder" integer,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "ResultId" integer,
    "StartDate" timestamp,
    "StartDateAvailabilityType" smallint,
    "EndDate" timestamp,
    "EndDateAvailabilityType" smallint,
    "Version" bigint
);

-- Discussion Posts
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionPosts" (
    "OrgUnitId" integer,
    "TopicId" bigint,
    "UserId" integer,
    "PostId" bigint,
    "ThreadId" bigint,
    "IsReply" boolean,
    "ParentPostId" bigint,
    "NumReplies" integer,
    "DatePosted" timestamp,
    "IsDeleted" boolean,
    "RatingSum" bigint,
    "NumRatings" bigint,
    "Score" numeric(19,9),
    "LastEditDate" timestamp,
    "SortOrder" integer,
    "Depth" integer,
    "Thread" varchar(400),
    "WordCount" integer,
    "AttachmentCount" integer,
    "Version" bigint
);

-- Discussion Posts Read Status
-- Primary key (informational, not enforced): UserId, PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): PostId -> DiscussionPosts.PostId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionPostsReadStatus" (
    "TopicId" bigint,
    "UserId" integer,
    "PostId" bigint,
    "IsRead" boolean,
    "FirstReadDate" timestamp,
    "LastReadDate" timestamp,
    "Version" bigint
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionTopicUserScores" (
    "UserId" integer,
    "TopicId" bigint,
    "Score" numeric(19,9),
    "IsGraded" boolean,
    "Version" bigint,
    "IsDeleted" boolean
);

-- Discussion Topics
-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionTopics" (
    "OrgUnitId" integer,
    "TopicId" bigint,
    "ForumId" bigint,
    "Name" varchar(1000),
    "Description" varchar(1000),
    "MustPostToParticipate" boolean,
    "AllowAnon" boolean,
    "IsHidden" boolean,
    "RequiresApproval" boolean,
    "LastPostDate" timestamp,
    "LastPostUserId" bigint,
    "NumViews" bigint,
    "SortOrder" integer,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "GradeItemId" integer,
    "ScoreOutOf" double precision,
    "ScoreCalculationMethod" varchar(19),
    "IncludeNonScoredValues" boolean,
    "Version" bigint,
    "ResultId" integer,
    "StartDate" timestamp,
    "StartDateAvailabilityType" smallint,
    "EndDate" timestamp,
    "EndDateAvailabilityType" smallint,
    "AIUtilization" integer,
    "DueDate" timestamp
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "EnrollmentsAndWithdrawals" (
    "LogId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "RoleId" integer,
    "Action" varchar(50),
    "ModifiedByUserId" integer,
    "EnrollmentDate" timestamp
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeBookSettings" (
    "OrgUnitId" integer,
    "GradeSchemeId" bigint,
    "GradingSystem" varchar(8),
    "UngradedItems" varchar(25),
    "IsAdjustedFinalGradeReleased" boolean,
    "IsCalculatedFinalGradeReleased" boolean,
    "LastModified" timestamp
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeObjects" (
    "GradeObjectId" integer,
    "OrgUnitId" integer,
    "ParentGradeObjectId" integer,
    "Name" varchar(128),
    "TypeName" varchar(50),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsAutoPointed" boolean,
    "IsFormula" boolean,
    "IsBonus" boolean,
    "MaxPoints" numeric(19,9),
    "CanExceedMaxGrade" boolean,
    "ExcludeFromFinalGradeCalc" boolean,
    "GradeSchemeId" bigint,
    "Weight" numeric(19,9),
    "NumLowestGradesToDrop" integer,
    "NumHighestGradesToDrop" integer,
    "WeightDistributionType" varchar(8),
    "CreatedDate" timestamp,
    "ToolName" varchar(50),
    "AssociatedToolItemId" bigint,
    "LastModified" timestamp,
    "ShortName" varchar(128),
    "GradeObjectTypeId" integer,
    "SortOrder" integer,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "ResultId" integer,
    "ToolId" integer,
    "Version" integer
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeObjectsLog" (
    "LogId" bigint,
    "Name" varchar(50),
    "GradeObjectId" integer,
    "UserId" integer,
    "GradeSymbolString" varchar(50),
    "PointsDenominator" numeric(19,9),
    "PointsNumerator" numeric(19,9),
    "WeightedDenominator" numeric(19,9),
    "WeightedNumerator" numeric(19,9),
    "Modified" timestamp,
    "ModifiedBy" integer
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" integer,
    "OrgUnitId" integer,
    "UserId" integer,
    "PointsNumerator" numeric(19,9),
    "PointsDenominator" numeric(19,9),
    "WeightedNumerator" numeric(19,9),
    "WeightedDenominator" numeric(19,9),
    "IsReleased" boolean,
    "IsDropped" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "Comments" varchar(1000),
    "PrivateComments" varchar(1000),
    "GradeText" varchar(50),
    "GradeReleasedDate" timestamp,
    "Version" bigint,
    "IsDeleted" boolean
);

-- Grade Scheme Ranges
-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS "GradeSchemeRanges" (
    "GradeSchemeRangeId" bigint,
    "GradeSchemeId" bigint,
    "SymbolString" varchar(100),
    "AssignedValue" numeric(19,9),
    "RangeStart" numeric(19,9),
    "IsDeleted" boolean,
    "Version" bigint
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeSchemes" (
    "GradeSchemeId" bigint,
    "OrgUnitId" integer,
    "SchemeName" varchar(128),
    "DeletedDate" timestamp,
    "Version" bigint
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "IntelligentAgentObjects" (
    "AgentId" bigint,
    "OrgUnitId" integer,
    "AgentName" varchar(128),
    "Description" varchar(1000),
    "Enabled" boolean,
    "SpecificRoles" varchar(1000),
    "LoginConditionEnabled" boolean,
    "LoginConditionThreshold" integer,
    "LoginConditionType" varchar(14),
    "AccessConditionEnabled" boolean,
    "AccessConditionThreshold" integer,
    "AccessConditionType" varchar(20),
    "ResultId" bigint,
    "RepeatType" varchar(10),
    "EmailWhenSatisfied" boolean,
    "EnableSchedule" boolean,
    "ScheduleType" varchar(10),
    "ScheduleRepeatsEvery" integer,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Intelligent Agent Run Log
-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
CREATE TABLE IF NOT EXISTS "IntelligentAgentRunLog" (
    "AgentId" bigint,
    "AgentRunId" bigint,
    "IsPracticeRun" boolean,
    "IsRunNow" boolean,
    "NumUsers" integer,
    "NumUsersWithErrors" integer,
    "NumUsersWithInfos" integer,
    "NumUsersWithWarnings" integer,
    "RunUserId" integer,
    "RunDate" timestamp
);

-- Intelligent Agent Run Users
-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "IntelligentAgentRunUsers" (
    "AgentId" bigint,
    "AgentRunId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "ActionTypeName" varchar(50),
    "ActionHasError" boolean,
    "ActionHasInfo" boolean,
    "ActionHasWarning" boolean,
    "ShouldRetry" boolean
);

-- JIT Provisioned Users Log
-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "JITProvisionedUsersLog" (
    "UserId" integer,
    "MappingField" varchar(32),
    "MappingFieldValue" varchar(270),
    "ProviderType" varchar(32),
    "ProviderId" varchar(1024),
    "RoleId" integer,
    "Timestamp" timestamp,
    "Action" varchar(16)
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LocalAuthenticationSecurityLog" (
    "UserId" integer,
    "Action" varchar(70),
    "ModifiedBy" integer,
    "ModifiedDate" timestamp
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageDeploymentAudit" (
    "Action" varchar(10),
    "DeploymentID" varchar(36),
    "ClientID" varchar(36),
    "DeploymentName" varchar(200),
    "IsDeploymentEnabled" boolean,
    "HasAssignmentsAndGrades" boolean,
    "HasDeepLinking" boolean,
    "HasNamesAndRoles" boolean,
    "HasSubmissionReview" boolean,
    "HasActivityItemProfile" boolean,
    "HasPlatformNotificationService" boolean,
    "HasContextCopy" boolean,
    "ModifiedBy" bigint,
    "Anonymous" boolean,
    "PreProvisioningEnabled" boolean,
    "SendOrgUnitInfo" boolean,
    "SendUserFirstName" boolean,
    "SendUserMiddleName" boolean,
    "SendUserLastName" boolean,
    "SendUserEmail" boolean,
    "SendBrightspaceUserID" boolean,
    "SendBrightspaceUsername" boolean,
    "SendBrightspaceOrgDefinedId" boolean,
    "SendLinkTitle" boolean,
    "SendLinkDescription" boolean,
    "OpenAsExternal" boolean,
    "AutoMigrateLinks" boolean,
    "IsSharedToManyOrgUnits" boolean,
    "AutoCreateGrades" boolean,
    "IncludeInFinalGrade" boolean,
    "Timestamp" timestamp,
    "HasAssetProcessor" boolean
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" varchar(10),
    "ClientId" varchar(255),
    "ToolName" varchar(200),
    "Domain" varchar(2083),
    "RedirectURLs" varchar(2083),
    "KeysetURL" varchar(255),
    "LoginURL" varchar(255),
    "LTIVersion" varchar(12),
    "IsRegistrationEnabled" boolean,
    "SendInstitutionRole" boolean,
    "TargetLinkURI" varchar(255),
    "ModifiedBy" bigint,
    "HasAssignmentAndGradeServices" boolean,
    "HasSubmissionReview" boolean,
    "HasDeepLinking" boolean,
    "HasNamesAndRoleProvisioningServices" boolean,
    "HasActivityItemProfile" boolean,
    "HasPlatformNotificationService" boolean,
    "Timestamp" timestamp,
    "HasAssetProcessor" boolean
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" uuid,
    "UserId" integer,
    "IMSRoleNames" varchar(10000),
    "ImpersonatingUserId" bigint,
    "ImpersonatingUserIMSRoleNames" varchar(10000),
    "LaunchDate" timestamp,
    "OrgUnitId" bigint,
    "LTILinkId" bigint,
    "DeploymentId" uuid,
    "ClientId" uuid,
    "ToolProviderId" varchar(300),
    "ContentTopicId" bigint,
    "ParentModuleId" bigint,
    "Placement" varchar(10),
    "MessageVersion" varchar(10),
    "RequestType" varchar(30)
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTILinkMigrationAudit" (
    "LTIMigrationId" uuid,
    "UserId" bigint,
    "MigrationDate" timestamp,
    "OrgUnitId" bigint,
    "LinkId" bigint,
    "LinkURL" varchar(2000),
    "LinkName" varchar(200),
    "ClientId" varchar(255),
    "RegistrationDomain" varchar(2083),
    "DeploymentId" uuid,
    "JobId" bigint,
    "Status" smallint,
    "FailureCode" smallint,
    "MigrationType" smallint,
    "LegacyURL" varchar(2083)
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "LTILinks" (
    "LtiLinkId" bigint,
    "OrgUnitId" integer,
    "Title" varchar(200),
    "LinkType" integer,
    "LTIVersion" varchar(12),
    "Url" varchar(2000),
    "Description" varchar(1000),
    "IsVisible" boolean,
    "SendTCInfo" boolean,
    "SendContextInfo" boolean,
    "SendCourseInfo" boolean,
    "SendOrgUnitInfo" boolean,
    "SendUserId" boolean,
    "SendUserName" boolean,
    "SendUserEmail" boolean,
    "SendLinkTitle" boolean,
    "SendLinkDescription" boolean,
    "SendD2LUserName" boolean,
    "SendD2LOrgDefinedId" boolean,
    "SendD2LOrgRoleId" boolean,
    "SendBrightspaceUserId" boolean,
    "Anonymous" boolean,
    "Shared" boolean,
    "UseToolProviderSecuritySettings" boolean,
    "LastModifiedDate" timestamp,
    "OuAvailabilitySetId" bigint,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "CreatedDate" timestamp,
    "DeploymentId" uuid,
    "LinkSubType" integer
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "MediaConsumptionLog" (
    "LogId" uuid,
    "UserId" integer,
    "ContentId" uuid,
    "RevisionId" uuid,
    "ContentType" varchar(5),
    "ClientApp" varchar(32),
    "DateConsumed" timestamp,
    "DurationPercentageWatched" integer
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "MediaObjects" (
    "ContentId" uuid,
    "Title" varchar(1000),
    "RevisionCount" integer,
    "OwnerId" integer,
    "LastModified" timestamp
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitAncestors" (
    "OrgUnitId" integer,
    "AncestorOrgUnitId" integer,
    "LastModified" timestamp,
    "DateDeleted" timestamp
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitDescendants" (
    "OrgUnitId" integer,
    "DescendantOrgUnitId" integer,
    "LastModified" timestamp,
    "DateDeleted" timestamp
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitParents" (
    "OrgUnitId" integer,
    "ParentOrgUnitId" integer,
    "RowVersion" bigint,
    "DateDeleted" timestamp
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitRecentAccess" (
    "OrgUnitId" integer,
    "UserId" integer,
    "LastAccessedDate" timestamp
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "OrganizationalUnits" (
    "OrgUnitId" integer,
    "Organization" varchar(50),
    "Type" varchar(50),
    "Name" varchar(128),
    "Code" varchar(50),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsActive" boolean,
    "CreatedDate" timestamp,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "RecycledDate" timestamp,
    "Version" bigint,
    "OrgUnitTypeId" integer
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomeDetails" (
    "OutcomeId" uuid,
    "OutcomeDefinitionSource" varchar(1000),
    "OutcomeDefinitionId" varchar(128),
    "ParentOutcomeId" uuid,
    "Description" varchar(1000),
    "Notation" varchar(1000),
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesAlignedToToolObjects" (
    "ObjectType" integer,
    "ObjectId" varchar(255),
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "AIUtilization" integer
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS "OutcomesAssessedCheckpoints" (
    "CheckpointId" uuid,
    "DemonstrationId" uuid,
    "Feedback" varchar(1000),
    "ConfigDecayRate" integer,
    "ConfigAggregationMethod" integer,
    "ConfigIncludedActivities" integer,
    "ConfigMultipleAttemptStrategy" integer,
    "ConfigRecentlyAssessedActivityCount" integer,
    "ConfigTieBreaker" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "HasMetAchievementThreshold" boolean,
    "AchievedLevelId" uuid
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesCourseSpecificScales" (
    "OrgUnitId" integer,
    "RegistryId" uuid,
    "ScaleId" uuid,
    "AchievementThreshold" uuid,
    "CreatedDate" timestamp,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesDemonstrations" (
    "DemonstrationId" uuid,
    "ExplicitlyEnteredScaleLevelId" uuid,
    "AutomaticallyGeneratedScaleLevelId" uuid,
    "AlignedObjectType" integer,
    "AlignedObjectId" varchar(1000),
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "IsPublished" boolean,
    "AssessedUserId" integer,
    "AssessedDate" timestamp,
    "AssessorUserId" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
CREATE TABLE IF NOT EXISTS "OutcomesInRegistries" (
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Outcomes Rubric Alignments
-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
CREATE TABLE IF NOT EXISTS "OutcomesRubricAlignments" (
    "RubricId" bigint,
    "CriterionId" bigint,
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesScaleDefinition" (
    "ScaleId" uuid,
    "Name" varchar(1000),
    "IsDefault" boolean,
    "UsePercentages" boolean,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "AchievementThreshold" uuid
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesScaleLevelDefinition" (
    "ScaleLevelId" uuid,
    "ScaleId" uuid,
    "Name" varchar(1000),
    "SortOrder" integer,
    "PercentageRangeStart" integer,
    "RGB" varchar(40),
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetCourse" (
    "RegistryId" uuid,
    "OrgUnitId" bigint,
    "SourceOutcomeSetId" bigint,
    "IsPrimary" boolean,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "ScaleId" uuid,
    "AchievementThreshold" uuid
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetOrg" (
    "OutcomeSetId" bigint,
    "OutcomeSetName" varchar(256),
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "ScaleId" uuid
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioCategories" (
    "CategoryId" uuid,
    "OrgUnitId" integer,
    "Name" varchar(256),
    "IsRetired" boolean,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceCategories" (
    "CategoryId" uuid,
    "EvidenceId" uuid,
    "Group" varchar(30),
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceLog" (
    "LogId" uuid,
    "ParentObjectId" uuid,
    "ObjectId" uuid,
    "ObjectType" varchar(40),
    "UserId" integer,
    "OrgUnitId" integer,
    "Action" varchar(16),
    "IsMobile" boolean,
    "ActionDate" timestamp
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceObjects" (
    "EvidenceId" uuid,
    "OwnerId" integer,
    "OrgUnitId" integer,
    "EvidenceType" varchar(30),
    "Title" varchar(1000),
    "IsApproved" boolean,
    "IsSpotlighted" boolean,
    "IsSharedToParents" boolean,
    "IsDeleted" boolean,
    "IsRecoverableByInstructor" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "IsSharedWithInstructor" boolean,
    "DateSharedWithInstructor" timestamp
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PreRequisiteConditionsMet" (
    "PreRequisiteId" integer,
    "UserId" integer,
    "DateMet" timestamp,
    "Action" varchar(7),
    "LastModified" timestamp
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswerOptions" (
    "AnswerId" bigint,
    "AnswerText" varchar(1000),
    "Weight" numeric(19,9),
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "AnswerOptionId" integer
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswers" (
    "AnswerId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "SortOrder" integer,
    "Weight" numeric(19,9),
    "Answer" varchar(1000),
    "Comment" varchar(1000),
    "Description" varchar(256)
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionLibrary" (
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "IsAutoGraded" boolean,
    "TemplateTypeId" integer,
    "QuestionType" varchar(28),
    "Name" varchar(256),
    "Question" varchar(1000),
    "Comment" varchar(1000),
    "AnswerKey" varchar(1000),
    "CreationDate" timestamp,
    "Version" bigint,
    "AllowsAttachments" boolean,
    "AIUtilization" integer
);

-- Question Pools
-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionPools" (
    "SectionId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Question Relationships
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionRelationships" (
    "CollectionId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "Order" bigint,
    "SectionId" bigint,
    "IsQuestionPool" boolean,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "Points" numeric(19,9),
    "Difficulty" integer,
    "IsBonus" boolean,
    "IsMandatory" boolean,
    "IsDeleted" boolean,
    "Version" bigint,
    "ObjectId" bigint
);

-- Quiz Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): QuizId -> QuizObjects.QuizId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttempts" (
    "AttemptId" bigint,
    "QuizId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "AttemptNumber" integer,
    "TimeStarted" timestamp,
    "TimeCompleted" timestamp,
    "Score" numeric(19,9),
    "IsGraded" boolean,
    "OldAttemptNumber" integer,
    "IsDeleted" boolean,
    "PossibleScore" numeric(19,9),
    "IsRetakeIncorrectOnly" boolean,
    "DueDate" timestamp,
    "TimeLimit" integer,
    "TimeLimitEnforced" boolean,
    "TimeLimitExceededBehaviour" varchar(128),
    "IsSynchronous" boolean,
    "DeductionPercentage" integer,
    "Version" bigint
);

-- Quiz Attempts Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizAttemptsLog" (
    "LogId" bigint,
    "AttemptId" bigint,
    "EventTypeId" integer,
    "Name" varchar(256),
    "Description" varchar(256),
    "EventTime" timestamp,
    "IPAddress" varchar(45),
    "UserId" integer,
    "IsDeleted" boolean
);

-- Quiz Objects
-- Primary key (informational, not enforced): QuizId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "QuizObjects" (
    "QuizId" bigint,
    "QuizName" varchar(256),
    "QuizDescription" varchar(1000),
    "QuizCategory" varchar(256),
    "IsActive" boolean,
    "OrgUnitId" integer,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "GradeObjectId" bigint,
    "OverallScoreCalculation" varchar(23),
    "QuizScoreDenominator" numeric(19,9),
    "HasPassword" boolean,
    "IPRestricted" boolean,
    "TimeLimit" integer,
    "TimeLimitEnforced" boolean,
    "AttemptsAllowed" integer,
    "PreventMovingBackwards" boolean,
    "AllowHints" boolean,
    "NotificationEmail" varchar(1000),
    "DisablePagerAccess" boolean,
    "DisplayInCalendar" boolean,
    "IsAttemptRldb" boolean,
    "IsSubviewRldb" boolean,
    "SortOrder" integer,
    "CategoryId" bigint,
    "ResultId" bigint,
    "IsRetakeIncorrectOnly" boolean,
    "PagingTypeId" integer,
    "IsSynchronous" boolean,
    "DeductionPercentage" integer,
    "AIStudySupport" boolean,
    "HideQuestionPoints" boolean,
    "IsSingleSession" boolean,
    "HideAnnotationTools" boolean
);

-- Quiz Survey Sections
-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizSurveySections" (
    "CollectionId" bigint,
    "SectionId" bigint,
    "Name" varchar(256),
    "NameIsDisplayed" boolean,
    "IsQuestionPool" boolean,
    "SectionText" varchar(1000),
    "SectionTextIsHTML" boolean,
    "IsSectionTextHidden" boolean,
    "QuestionPoints" numeric(19,9),
    "NumQuestions" integer,
    "NumChoices" integer,
    "Shuffle" boolean,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Quiz User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "QuizUserAnswerResponses" (
    "AttemptId" bigint,
    "AttemptNumber" integer,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "AnswerId" bigint,
    "SortOrder" integer,
    "IsCorrect" boolean,
    "UserSelection" bigint,
    "UserAnswer" varchar(1000),
    "FileSetId" bigint,
    "LastModified" timestamp,
    "IsDeleted" boolean
);

-- Quiz User Answers
-- Primary key (informational, not enforced): AttemptId, ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> QuizAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): SectionId -> QuizSurveySections.SectionId
CREATE TABLE IF NOT EXISTS "QuizUserAnswers" (
    "AttemptId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "TimeCompleted" timestamp,
    "QuestionNumber" integer,
    "Comment" varchar(1000),
    "SortOrder" integer,
    "Score" numeric(19,9),
    "Page" integer,
    "SectionId" bigint,
    "ObjectId" bigint,
    "OutOf" numeric(19,9),
    "TimeStarted" timestamp,
    "IsBonus" boolean,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "QuizTimeCompleted" timestamp
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ReleaseConditionObjects" (
    "PreRequisiteId" integer,
    "ResultId" integer,
    "OrgUnitId" integer,
    "Name" varchar(64),
    "IsNegativeCondition" boolean,
    "PreRequisiteToolId" integer,
    "Id1" integer,
    "Id2" integer,
    "ResultToolId" integer,
    "UsesPercentage" boolean,
    "OperatorTypeDesc" varchar(3),
    "Version" bigint,
    "Guid1" uuid,
    "Guid2" uuid
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReleaseConditionResults" (
    "ResultId" integer,
    "UserId" integer,
    "Met" varchar(7),
    "Version" bigint,
    "DeletedDate" timestamp
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReofferCourse" (
    "CourseOfferingId" integer,
    "SourceCourseId" integer,
    "CreatedBy" integer,
    "ReofferDate" timestamp
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "RoleDetails" (
    "RoleId" integer,
    "RoleName" varchar(120),
    "Description" varchar(400),
    "IsCascading" boolean,
    "InClassList" boolean,
    "ClassListRoleName" varchar(120),
    "ClassListShowGroups" boolean,
    "ClassListShowSections" boolean,
    "ClassListDisplayRole" boolean,
    "AccessInactiveCO" boolean,
    "HasSpecialAccess" boolean,
    "AddToCourseOfferingGroups" boolean,
    "CanBeAutoEnrolledIntoGroups" boolean,
    "AddToCourseOfferingSections" boolean,
    "CanBeAutoEnrolledIntoSections" boolean,
    "AccessPastCourses" boolean,
    "AccessFutureCourses" boolean,
    "SortOrder" integer,
    "ShowInContent" boolean,
    "ShowInDiscussionAssess" boolean,
    "ShowInDiscussionStats" boolean,
    "ShowInGrades" boolean,
    "ShowInAttendance" boolean,
    "AllowSelfEnrollInGroups" boolean,
    "ShowInRegistration" boolean,
    "ShowInUserProgress" boolean,
    "RoleAlias" varchar(120),
    "RoleCode" varchar(100),
    "LastModifiedDate" timestamp,
    "DeletedBy" integer
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "RubricAssessment" (
    "RubricId" bigint,
    "OrgUnitId" integer,
    "UserId" integer,
    "Score" numeric(36,2),
    "AssessedByUserId" integer,
    "AssessmentDate" timestamp,
    "IsCompleted" boolean,
    "ActivityType" varchar(50),
    "ActivityObjectId" bigint,
    "DateCreated" timestamp,
    "AssessmentId" bigint,
    "LevelAchievedId" bigint,
    "ActivityId" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Rubric Assessment Criteria
-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricAssessmentCriteria" (
    "AssessmentId" bigint,
    "RubricId" bigint,
    "Score" numeric(19,9),
    "Feedback" varchar(4000),
    "IsScoreOverridden" boolean,
    "CriterionId" bigint,
    "LevelAchievedId" bigint,
    "Version" bigint
);

-- Rubric Criteria Levels
-- Primary key (informational, not enforced): RubricId, CriterionId, LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "RubricCriteriaLevels" (
    "RubricId" bigint,
    "CriterionId" bigint,
    "Description" varchar(1000),
    "Feedback" varchar(1000),
    "Value" numeric(19,9),
    "LevelId" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Rubric Object Criteria
-- Primary key (informational, not enforced): CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectCriteria" (
    "RubricId" bigint,
    "CriterionId" bigint,
    "Name" varchar(500),
    "SortOrder" integer,
    "CriteriaGroupId" bigint,
    "GroupName" varchar(256),
    "GroupSortOrder" integer,
    "LevelSetId" bigint,
    "IsDeleted" boolean
);

-- Rubric Object Levels
-- Primary key (informational, not enforced): LevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricObjectLevels" (
    "RubricId" bigint,
    "LevelId" bigint,
    "Name" varchar(256),
    "Description" varchar(1000),
    "Feedback" varchar(1000),
    "Value" numeric(19,9),
    "RangeStartValue" numeric(19,9),
    "SortOrder" integer,
    "LevelSetId" bigint,
    "IsDeleted" boolean
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "RubricObjects" (
    "RubricId" bigint,
    "Name" varchar(256),
    "RubricStatus" varchar(256),
    "Description" varchar(1000),
    "RubricType" varchar(256),
    "ScoringMethods" varchar(256),
    "IsScoreVisible" boolean,
    "OrgUnitID" integer,
    "IsShared" boolean,
    "IsDeleted" boolean
);

-- Rubrics Edit
-- Primary key (informational, not enforced): AuditLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): LevelId -> RubricObjectLevels.LevelId
-- Join (informational): RubricId -> RubricObjects.RubricId
CREATE TABLE IF NOT EXISTS "RubricsEdit" (
    "AuditLogId" uuid,
    "RubricId" bigint,
    "CriterionId" bigint,
    "LevelId" bigint,
    "ModifiedBy" integer,
    "ModifiedObjectType" integer,
    "CriteriaGroupId" bigint,
    "ModifiedDate" timestamp,
    "PreviousValue" varchar(4000),
    "ModifiedValue" varchar(4000),
    "IsLocked" boolean,
    "Version" integer
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMActivities" (
    "ActivityId" uuid,
    "ScormObjectId" uuid,
    "ParentActivityId" uuid,
    "NumChildren" integer,
    "InternalId" varchar(255),
    "Title" varchar(200),
    "CompletionThreshold" real,
    "PassingScore" real,
    "PassingScoreUsed" boolean,
    "ScoreMin" real,
    "ScoreMax" real,
    "LastModified" timestamp
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMActivityAttempts" (
    "VisitId" uuid,
    "ActivityId" uuid,
    "AttemptNumber" integer,
    "Completion" varchar(100),
    "Success" varchar(100),
    "Score" real,
    "ScoreRaw" real,
    "TimeSpent" real,
    "Progress" real,
    "LastModified" timestamp
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMInteractionAttempts" (
    "VisitId" uuid,
    "InteractionId" uuid,
    "AttemptNumber" integer,
    "ActivityId" uuid,
    "Timestamp" timestamp,
    "Response" varchar(1000),
    "Result" varchar(100),
    "NumericResult" real,
    "TimeSpent" real,
    "LastModified" timestamp
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS "SCORMInteractionObjectives" (
    "InteractionId" uuid,
    "ObjectiveId" uuid,
    "LastModified" timestamp
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS "SCORMInteractions" (
    "InteractionId" uuid,
    "ActivityId" uuid,
    "InternalId" varchar(255),
    "InteractionType" varchar(100),
    "Description" varchar(250),
    "Weighting" real,
    "CorrectResponses" varchar(2000),
    "LastModified" timestamp
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMObjectiveAttempts" (
    "VisitId" uuid,
    "ObjectiveId" uuid,
    "AttemptNumber" integer,
    "Score" real,
    "ScoreRaw" real,
    "Success" varchar(100),
    "Completion" varchar(100),
    "Progress" real,
    "LastModified" timestamp
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMObjectives" (
    "ObjectiveId" uuid,
    "ScormObjectId" uuid,
    "ObjectiveType" varchar(100),
    "ActivityId" uuid,
    "InternalId" varchar(255),
    "IsPrimary" boolean,
    "Description" varchar(250),
    "ScoreMin" real,
    "ScoreMax" real,
    "LastModified" timestamp
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SCORMObjects" (
    "ScormObjectId" uuid,
    "OrgUnitId" integer,
    "ContentObjectId" integer,
    "ContentServiceContentId" uuid,
    "ContentServiceRevisionId" uuid,
    "ContentServiceTopicId" uuid,
    "Title" varchar(1000),
    "Description" varchar(1000),
    "LearningStandard" varchar(100),
    "LastModified" timestamp,
    "LastModifiedBy" integer
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SCORMVisits" (
    "VisitId" uuid,
    "ScormObjectId" uuid,
    "UserId" integer,
    "OrgUnitId" integer,
    "FirstAccessDate" timestamp,
    "LastAccessDate" timestamp,
    "CompletedDate" timestamp,
    "Completion" varchar(100),
    "Success" varchar(100),
    "Score" real,
    "TimeSpent" integer,
    "Progress" real,
    "LastModified" timestamp
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SessionHistory" (
    "SessionId" bigint,
    "OrgId" integer,
    "UserId" integer,
    "DateStarted" timestamp,
    "DateEnded" timestamp,
    "LastAccessed" timestamp,
    "TimedOut" boolean,
    "HistoryID" bigint
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SISCourseMergeLog" (
    "BatchId" uuid,
    "JobType" varchar(32),
    "Status" varchar(32),
    "OriginalTargetOrgUnitId" bigint,
    "OriginalSourceOrgUnitId" bigint,
    "SourceSystemId" bigint,
    "NumberOfCoursesInBatch" integer,
    "UserId" bigint,
    "ErrorType" varchar(48),
    "Timestamp" timestamp
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SourceCourseDeployHistory" (
    "SourceCourseDeployId" bigint,
    "SourceCourseOrgUnitId" integer,
    "TargetCourseOrgUnitId" integer,
    "UserId" integer,
    "Status" varchar(128),
    "QueuedTime" timestamp,
    "CompletionTime" timestamp
);

-- Survey Attempts
-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyAttempts" (
    "AttemptId" bigint,
    "SurveyId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "AttemptNumber" integer,
    "TimeStarted" timestamp,
    "TimeCompleted" timestamp,
    "AttemptedFromOrgUnitId" integer,
    "OldAttemptNumber" integer,
    "IsDeleted" boolean,
    "Version" bigint
);

-- Survey Objects
-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SurveyObjects" (
    "SurveyId" bigint,
    "SurveyName" varchar(1000),
    "CategoryId" bigint,
    "OrgUnitId" integer,
    "Description" varchar(1000),
    "DescriptionEnabled" boolean,
    "HasInstantFeedback" boolean,
    "IsAnonymous" boolean,
    "IsVisible" boolean,
    "SubmissionMessage" varchar(1000),
    "Footer" varchar(1000),
    "FooterIsDisplayed" boolean,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DisplayInCalendar" boolean,
    "ResultId" bigint,
    "AttemptsAllowed" integer,
    "SortOrder" integer,
    "CreatedBy" integer,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "Version" bigint,
    "CategoryName" varchar(256)
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswerResponses" (
    "AttemptId" bigint,
    "AttemptNumber" integer,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "AnswerId" bigint,
    "SortOrder" bigint,
    "IsCorrect" boolean,
    "UserSelection" bigint,
    "UserAnswer" varchar(1000),
    "FileSetId" bigint,
    "LastModified" timestamp,
    "IsDeleted" boolean
);

-- Survey User Answers
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswers" (
    "AttemptId" bigint,
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "TimeCompleted" timestamp,
    "QuestionNumber" integer,
    "Comment" varchar(1000),
    "SortOrder" integer,
    "Score" numeric(19,9),
    "Page" integer,
    "Assigned" boolean,
    "IsDeleted" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "SurveyTimeCompleted" timestamp
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessLog" (
    "SessionId" varchar(36),
    "UserId" integer,
    "Timestamp" timestamp,
    "State" varchar(20),
    "Source" varchar(20),
    "AppVersion" varchar(20),
    "Device" varchar(50),
    "IsOfflineMode" boolean,
    "IPAddress" varchar(45)
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessSummary" (
    "UserId" integer,
    "ImpersonatingUserId" integer,
    "LastSystemAccess" timestamp,
    "Source" varchar(20)
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Tools" (
    "ToolId" integer,
    "Name" varchar(50),
    "DisplayName" varchar(200),
    "Version" bigint
);

-- TurnItIn Submissions
-- Primary key (informational, not enforced): SubmissionId, FileId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): SubmissionId -> AssignmentSubmissionDetails.SubmissionId
CREATE TABLE IF NOT EXISTS "TurnItInSubmissions" (
    "DropboxId" bigint,
    "SubmissionId" bigint,
    "FileId" bigint,
    "LastSubmissionDate" timestamp,
    "SubmissionStatus" smallint,
    "SubmissionErrorType" smallint,
    "ErrorMessage" varchar(255),
    "SubmittedBy" integer,
    "LastRefreshDate" timestamp,
    "LastModified" timestamp
);

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserAttributeDefinitions" (
    "AttributeId" varchar(128),
    "Name" varchar(128),
    "Type" varchar(8),
    "AllowMultiple" boolean,
    "IsDefault" boolean,
    "LastModified" timestamp,
    "ModifiedBy" integer,
    "IsDeleted" boolean,
    "Version" bigint
);

-- User Attribute Values
-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserAttributeValues" (
    "UserId" integer,
    "AttributeId" varchar(128),
    "Value" varchar(4000),
    "LastModified" timestamp,
    "ModifiedBy" integer,
    "IsDeleted" boolean,
    "Version" integer
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserEnrollments" (
    "OrgUnitId" integer,
    "UserId" integer,
    "RoleName" varchar(60),
    "EnrollmentDate" timestamp,
    "EnrollmentType" varchar(50),
    "RoleId" integer
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserLogins" (
    "UserId" integer,
    "UserName" varchar(256),
    "IP" varchar(64),
    "SessionId" integer,
    "StatusType" varchar(50),
    "AttemptDate" timestamp,
    "ImpersonatingUserId" integer,
    "LoginAttemptId" varchar(36),
    "LoginSource" varchar(50)
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" integer,
    "UserName" varchar(270),
    "OrgDefinedId" varchar(256),
    "FirstName" varchar(64),
    "MiddleName" varchar(64),
    "LastName" varchar(64),
    "IsActive" boolean,
    "ExternalEmail" varchar(256),
    "CreationDate" timestamp,
    "Version" bigint,
    "OrgRoleId" integer,
    "DateDeleted" timestamp
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" integer,
    "CourseName" varchar(255),
    "MeetingId" varchar(36),
    "MeetingName" varchar(255),
    "CreationUserId" integer,
    "CreationDate" timestamp,
    "ScheduledDate" timestamp,
    "ScheduledDuration" integer,
    "IsPublished" boolean,
    "ExternalLinksEnabled" boolean,
    "WholeClassInvited" boolean,
    "IsCancelled" boolean,
    "StartDateTime" timestamp,
    "EndDateTime" timestamp,
    "IsRecorded" boolean
);
