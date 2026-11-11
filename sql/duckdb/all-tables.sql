-- All 144 Brightspace Data Sets tables for DuckDB (current).
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
    "QuizTimeLimitMultiplier" DECIMAL(5,2),
    "QuizTimeLimitExtraTime" INTEGER,
    "QuizControlAlwaysAllowRightClick" BOOLEAN,
    "ModifiedBy" BIGINT,
    "LastModified" TIMESTAMP
);

-- Activity Exemptions Log
-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityExemptionsLog" (
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "ObjectId" INTEGER,
    "ActivityId" VARCHAR,
    "LogTypeName" VARCHAR,
    "LastModifiedUtc" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "ActivityExemptionsLogId" BIGINT,
    "ToolId" INTEGER
);

-- Activity Feed Comment Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentLog" (
    "LogId" UUID,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "CommentId" UUID,
    "Action" VARCHAR,
    "ActionDate" TIMESTAMP,
    "Content" VARCHAR,
    "PostId" UUID
);

-- Activity Feed Comment Objects
-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentObjects" (
    "OrgUnitId" INTEGER,
    "CommentId" UUID,
    "LastModifiedBy" INTEGER,
    "LastModified" TIMESTAMP,
    "Content" VARCHAR,
    "IsDeleted" BOOLEAN,
    "PostId" UUID,
    "Version" BIGINT
);

-- Activity Feed Post Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostLog" (
    "LogId" UUID,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "PostId" UUID,
    "PostType" VARCHAR,
    "Action" VARCHAR,
    "ActionDate" TIMESTAMP,
    "DropboxId" BIGINT,
    "Content" VARCHAR,
    "CommentCount" INTEGER,
    "AttachmentCount" INTEGER
);

-- Activity Feed Post Objects
-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostObjects" (
    "OrgUnitId" INTEGER,
    "PostId" UUID,
    "PostType" VARCHAR,
    "LastModifiedBy" INTEGER,
    "LastModified" TIMESTAMP,
    "DropboxId" BIGINT,
    "Content" VARCHAR,
    "IsDeleted" BOOLEAN,
    "CommentCount" INTEGER,
    "AttachmentCount" INTEGER,
    "Version" BIGINT
);

-- AI Consumption
-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "AIConsumption" (
    "ConsumptionId" VARCHAR,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "Date" TIMESTAMP,
    "GenerationCount" INTEGER,
    "ConsumptionSource" INTEGER
);

-- Announcements
-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "Announcements" (
    "AnnouncementId" BIGINT,
    "OrgUnitId" BIGINT,
    "Title" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsGlobal" BOOLEAN,
    "IsDraft" BOOLEAN,
    "NumAttachments" INTEGER,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "CreatedBy" INTEGER,
    "IsAuthorInfoShown" BOOLEAN,
    "CreatedDate" TIMESTAMP,
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
    "UserId" INTEGER,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "ModifiedBy" INTEGER,
    "LastModified" TIMESTAMP,
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
    "NumberOfFilesSubmitted" INTEGER,
    "TotalFileSize" BIGINT,
    "SubmittedByUserId" INTEGER,
    "DateSubmitted" TIMESTAMP,
    "Comments" VARCHAR,
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
    "OrgUnitId" INTEGER,
    "SubmitterId" BIGINT,
    "SubmitterType" VARCHAR,
    "FileSubmissionCount" INTEGER,
    "TotalFileSize" BIGINT,
    "FeedbackUserId" INTEGER,
    "FeedbackIsRead" BOOLEAN,
    "Score" DECIMAL(19,9),
    "IsGraded" BOOLEAN,
    "LastSubmissionDate" TIMESTAMP,
    "Feedback" VARCHAR,
    "FeedbackLastModified" TIMESTAMP,
    "FeedbackReadDate" TIMESTAMP,
    "CompletionDate" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Assignment Summary
-- Primary key (informational, not enforced): DropboxId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AssignmentSummary" (
    "DropboxId" BIGINT,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "Category" VARCHAR,
    "Type" VARCHAR,
    "GradeItemId" BIGINT,
    "PossibleScore" DECIMAL(19,9),
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "IsRestricted" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "TurnItInEnabled" BOOLEAN,
    "IsHidden" BOOLEAN,
    "SortOrder" INTEGER,
    "SubmissionType" VARCHAR,
    "CompletionType" VARCHAR,
    "ResultId" INTEGER,
    "CategoryId" BIGINT,
    "Version" BIGINT,
    "StartDateAvailabilityType" SMALLINT,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INTEGER,
    "Instructions" VARCHAR
);

-- Attendance Registers
-- Primary key (informational, not enforced): AttendanceRegisterId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceRegisters" (
    "AttendanceRegisterId" BIGINT,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "SchemeId" BIGINT,
    "IsVisible" BOOLEAN,
    "IncludeAllUsers" BOOLEAN,
    "CauseForConcern" DECIMAL(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER
);

-- Attendance Schemes
-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AttendanceSchemes" (
    "SchemeId" BIGINT,
    "OrgUnitId" INTEGER,
    "SchemeName" VARCHAR,
    "SchemeSymbolId" BIGINT,
    "SymbolName" VARCHAR,
    "SymbolValue" VARCHAR,
    "Percentage" DECIMAL(19,9),
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER
);

-- Attendance Sessions
-- Primary key (informational, not enforced): AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceRegisterId -> AttendanceRegisters.AttendanceRegisterId
CREATE TABLE IF NOT EXISTS "AttendanceSessions" (
    "AttendanceSessionId" BIGINT,
    "AttendanceRegisterId" BIGINT,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "SortOrder" INTEGER,
    "Version" BIGINT,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER
);

-- Attendance User Sessions
-- Primary key (informational, not enforced): UserId, AttendanceSessionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttendanceSessionId -> AttendanceSessions.AttendanceSessionId
CREATE TABLE IF NOT EXISTS "AttendanceUserSessions" (
    "UserId" INTEGER,
    "AttendanceSessionId" BIGINT,
    "SchemeSymbolId" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Audio Video Processed
-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS "AudioVideoProcessed" (
    "ContentId" UUID,
    "RevisionId" UUID,
    "RevisionNumber" INTEGER,
    "Type" VARCHAR,
    "Source" VARCHAR,
    "RevisionSize" BIGINT,
    "Duration" INTEGER,
    "RequiredTranscoding" BOOLEAN,
    "RequiredTranscribing" BOOLEAN,
    "LastModified" TIMESTAMP
);

-- Auditor Relationships Log
-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AuditorRelationshipsLog" (
    "AuditorId" INTEGER,
    "UserToAuditId" INTEGER,
    "OrgUnitId" INTEGER,
    "Action" VARCHAR,
    "ModifiedBy" INTEGER,
    "ModifiedDate" TIMESTAMP
);

-- Award Objects
-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "AwardObjects" (
    "AwardId" BIGINT,
    "Name" VARCHAR,
    "AwardTypeId" INTEGER,
    "Type" VARCHAR,
    "Description" VARCHAR,
    "ExpiryCalculationType" VARCHAR,
    "ExpiryNotificationType" VARCHAR,
    "ExpiryDate" TIMESTAMP,
    "ImagePath" VARCHAR,
    "CreatedByUserId" BIGINT,
    "LastModified" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "Criteria" VARCHAR
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
    "IssuedBy" INTEGER,
    "IssueDate" TIMESTAMP,
    "ExpiryDate" TIMESTAMP,
    "IssuedId" BIGINT,
    "Criteria" VARCHAR,
    "Evidence" VARCHAR,
    "RevokedDate" TIMESTAMP,
    "RevokedReason" VARCHAR,
    "RevokedBy" BIGINT,
    "LastModifiedBy" BIGINT,
    "LastModifiedDate" TIMESTAMP,
    "Version" BIGINT,
    "CertificateId" VARCHAR
);

-- Brightspace Email Log
-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "BrightspaceEmailLog" (
    "MailId" INTEGER,
    "SenderUserId" INTEGER,
    "SenderAddress" VARCHAR,
    "RecipientAddress" VARCHAR,
    "RecipientType" VARCHAR,
    "DateTimeSent" TIMESTAMP,
    "Subject" VARCHAR
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
    "Title" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "TimeZoneIdentifier" VARCHAR,
    "IsAllDayEvent" BOOLEAN,
    "RecurrenceType" VARCHAR,
    "RecurrenceInterval" INTEGER,
    "CreatedByUserId" INTEGER,
    "LastModified" TIMESTAMP,
    "EventObjectTypeName" VARCHAR,
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
    "Name" VARCHAR,
    "Description" VARCHAR,
    "DescriptionIsHtml" BOOLEAN,
    "SortOrder" INTEGER,
    "LastModifiedUtc" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER,
    "Version" BIGINT
);

-- Checklist Completions
-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCompletions" (
    "UserId" INTEGER,
    "DateCompleted" TIMESTAMP,
    "ItemId" BIGINT,
    "LastModified" TIMESTAMP,
    "IsCompleted" BOOLEAN,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER,
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
    "Name" VARCHAR,
    "Description" VARCHAR,
    "DescriptionIsHtml" BOOLEAN,
    "DueDate" TIMESTAMP,
    "ScheduleId" INTEGER,
    "SortOrder" INTEGER,
    "IsAutoChecked" BOOLEAN,
    "LastModifiedUtc" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER,
    "Version" BIGINT
);

-- Checklist Objects
-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ChecklistObjects" (
    "ChecklistId" BIGINT,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "DescriptionIsHtml" BOOLEAN,
    "SharedUserId" INTEGER,
    "DisplayInNewWindow" BOOLEAN,
    "SortOrder" INTEGER,
    "Version" BIGINT,
    "ResultId" INTEGER,
    "DateDeleted" TIMESTAMP,
    "DeletedBy" INTEGER
);

-- Competency Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyActivities" (
    "ActivityId" BIGINT,
    "OrgUnitId" INTEGER,
    "ActivityName" VARCHAR,
    "ActivityTypeId" INTEGER,
    "AssessmentType" VARCHAR,
    "ObjectLookupId" BIGINT,
    "RubricId" BIGINT,
    "LevelId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AssessmentThresholdCriteria" VARCHAR,
    "AssessmentThreshold" DECIMAL(19,9),
    "IsAutoEval" BOOLEAN,
    "RubricName" VARCHAR,
    "RubricLevelRequired" VARCHAR,
    "ObjectId" BIGINT,
    "ActivityType" VARCHAR,
    "Version" BIGINT
);

-- Competency Activity Log
-- Primary key (informational, not enforced): ActivityId, ActivityLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityLog" (
    "ActivityId" BIGINT,
    "ActivityLogId" BIGINT,
    "LogTypeId" INTEGER,
    "LogTypeName" VARCHAR,
    "LogDateTime" TIMESTAMP,
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
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "LearningObjectId" BIGINT,
    "IsAchieved" BOOLEAN,
    "PercentAchieved" DECIMAL(19,9),
    "RubricScore" DECIMAL(19,9),
    "RubricLevelAchieved" VARCHAR,
    "RubricId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AchievedDate" TIMESTAMP,
    "Version" BIGINT
);

-- Competency Log
-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
CREATE TABLE IF NOT EXISTS "CompetencyLog" (
    "CompetencyLogId" BIGINT,
    "LogTypeId" INTEGER,
    "LogTypeName" VARCHAR,
    "ObjectId" BIGINT,
    "ObjectTypeId" INTEGER,
    "ObjectTypeName" VARCHAR,
    "ObjectVersion" INTEGER,
    "LogDateTime" TIMESTAMP,
    "ModifiedBy" BIGINT,
    "IndirectObjectId" BIGINT,
    "IndirectObjectTypeName" VARCHAR,
    "IndirectObjectTypeId" INTEGER,
    "IndirectObjectVersion" INTEGER
);

-- Competency Objects
-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyObjects" (
    "ObjectId" BIGINT,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "Type" VARCHAR,
    "ReadyForEvaluation" BOOLEAN,
    "Status" VARCHAR,
    "Description" VARCHAR,
    "NeedReevaluation" BOOLEAN,
    "ReevaluationIfAchieved" BOOLEAN,
    "ReevaluationIfNotAchieved" BOOLEAN,
    "AdditionalIdentifier" VARCHAR,
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
    "Depth" INTEGER,
    "EntryTime" INTEGER
);

-- Content Files Properties Log
-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" INTEGER,
    "ContentObjectId" INTEGER,
    "Action" VARCHAR,
    "FilePath" VARCHAR,
    "FileName" VARCHAR,
    "FileExtension" VARCHAR,
    "FileSizeBytes" BIGINT,
    "UploadDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "LastModified" TIMESTAMP
);

-- Content Objects
-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS "ContentObjects" (
    "ContentObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "Title" VARCHAR,
    "ContentObjectType" VARCHAR,
    "CompletionType" VARCHAR,
    "ParentContentObjectId" INTEGER,
    "Location" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "ObjectId1" INTEGER,
    "ObjectId2" INTEGER,
    "ObjectId3" INTEGER,
    "LastModified" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "SortOrder" INTEGER,
    "Depth" INTEGER,
    "ToolId" INTEGER,
    "IsHidden" BOOLEAN,
    "ResultId" INTEGER,
    "DeletedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedBy" INTEGER,
    "DeletedBy" INTEGER,
    "AIUtilization" INTEGER,
    "Version" BIGINT
);

-- Content User Completion
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserCompletion" (
    "ContentObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "DateCompleted" TIMESTAMP,
    "LastModified" TIMESTAMP,
    "Version" BIGINT,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "AutomaticDateCompleted" TIMESTAMP,
    "ManualDateCompleted" TIMESTAMP
);

-- Content User Progress
-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserProgress" (
    "ContentObjectId" INTEGER,
    "UserId" INTEGER,
    "CompletedDate" TIMESTAMP,
    "LastVisited" TIMESTAMP,
    "IsRead" BOOLEAN,
    "NumRealVisits" INTEGER,
    "NumFakeVisits" INTEGER,
    "TotalTime" BIGINT,
    "IsVisited" BOOLEAN,
    "IsCurrentBookmark" BOOLEAN,
    "IsSelfAssessComplete" BOOLEAN,
    "LastModified" TIMESTAMP,
    "Version" BIGINT
);

-- Course Access
-- Primary key (informational, not enforced): OrgUnitId, UserId, DayAccessed
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccess" (
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "DayAccessed" TIMESTAMP
);

-- Course Access Log
-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseAccessLog" (
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "Timestamp" TIMESTAMP,
    "Source" VARCHAR
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
    "DateCreated" TIMESTAMP,
    "HiddenAward" BOOLEAN,
    "ConditionSetId" BIGINT,
    "LastModified" TIMESTAMP,
    "Credits" DECIMAL(9,2),
    "IsAssociated" BOOLEAN,
    "Version" BIGINT
);

-- Course Copy Logs
-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseCopyLogs" (
    "SourceOrgUnitId" INTEGER,
    "DestinationOrgUnitId" INTEGER,
    "UserId" BIGINT,
    "Status" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsDestinationNew" BOOLEAN,
    "CopyProtectedResources" BOOLEAN,
    "CopyCourseJobId" BIGINT,
    "StatusId" INTEGER
);

-- Course Publisher Launches
-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CoursePublisherLaunches" (
    "LaunchId" UUID,
    "OrgUnitId" INTEGER,
    "RecipientId" UUID,
    "UserId" INTEGER,
    "RoleId" INTEGER,
    "LaunchMethod" VARCHAR,
    "ExternalUserId" VARCHAR,
    "ExternalLMSType" VARCHAR,
    "IsNewUser" BOOLEAN,
    "LastModified" TIMESTAMP
);

-- Course Publisher Recipients
-- Primary key (informational, not enforced): RecipientID
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CoursePublisherRecipients" (
    "RecipientID" UUID,
    "Name" VARCHAR,
    "CreatedAt" TIMESTAMP,
    "LastModified" TIMESTAMP
);

-- CPD Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDCategories" (
    "CategoryId" INTEGER,
    "Name" VARCHAR,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);

-- CPD Job Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
CREATE TABLE IF NOT EXISTS "CPDJobTargets" (
    "PrincipalId" INTEGER,
    "CategoryId" INTEGER,
    "JobTitle" VARCHAR,
    "StructuredMinutes" INTEGER,
    "UnstructuredMinutes" INTEGER,
    "StructuredRecordCount" INTEGER,
    "UnstructuredRecordCount" INTEGER,
    "StartDate" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "LastModified" TIMESTAMP,
    "Version" BIGINT
);

-- CPD Methods
-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDMethods" (
    "MethodId" INTEGER,
    "Name" VARCHAR,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);

-- CPD Question Answers
-- Primary key (informational, not enforced): AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): QuestionId -> CPDQuestions.QuestionId
-- Join (informational): RecordId -> CPDUserRecords.RecordId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDQuestionAnswers" (
    "AnswerId" INTEGER,
    "AnswerText" VARCHAR,
    "QuestionId" INTEGER,
    "RecordId" INTEGER,
    "UserId" INTEGER,
    "Action" VARCHAR,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);

-- CPD Questions
-- Primary key (informational, not enforced): QuestionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "CPDQuestions" (
    "QuestionId" INTEGER,
    "QuestionText" VARCHAR,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);

-- CPD User Records
-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserRecords" (
    "RecordId" INTEGER,
    "RecordName" VARCHAR,
    "State" VARCHAR,
    "UserId" INTEGER,
    "Category" INTEGER,
    "Method" INTEGER,
    "CreditMinutes" INTEGER,
    "Evidence" VARCHAR,
    "Type" VARCHAR,
    "Grade" DECIMAL(4,3),
    "DateCompleted" TIMESTAMP,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "Version" BIGINT
);

-- CPD User Targets
-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CPDUserTargets" (
    "PrincipalId" INTEGER,
    "CategoryId" INTEGER,
    "UserId" INTEGER,
    "StructuredMinutes" INTEGER,
    "UnstructuredMinutes" INTEGER,
    "StructuredRecordCount" INTEGER,
    "UnstructuredRecordCount" INTEGER,
    "StartDate" TIMESTAMP,
    "DateDeleted" TIMESTAMP,
    "LastModified" TIMESTAMP,
    "Version" BIGINT
);

-- Creator+ Practices Adoption
-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CreatorPracticesAdoption" (
    "ActivityInstanceId" INTEGER,
    "CreatedById" INTEGER,
    "OrgUnitId" INTEGER,
    "PracticeType" VARCHAR,
    "PracticeTitle" VARCHAR,
    "ProviderObjectId" INTEGER,
    "CreatedDate" TIMESTAMP,
    "Version" BIGINT
);

-- Creator+ Practices Engagement
-- Primary key (informational, not enforced): PracticeEngagementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityInstanceId -> CreatorPracticesAdoption.ActivityInstanceId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CreatorPracticesEngagement" (
    "PracticeEngagementId" INTEGER,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "CompletionStatus" VARCHAR,
    "ActivityInstanceId" INTEGER,
    "CompletionDate" TIMESTAMP,
    "Version" BIGINT
);

-- Discussion Forums
-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionForums" (
    "OrgUnitId" INTEGER,
    "ForumId" BIGINT,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "SortOrder" INTEGER,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "ResultId" INTEGER,
    "StartDate" TIMESTAMP,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP,
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
    "OrgUnitId" INTEGER,
    "TopicId" BIGINT,
    "UserId" INTEGER,
    "PostId" BIGINT,
    "ThreadId" BIGINT,
    "IsReply" BOOLEAN,
    "ParentPostId" BIGINT,
    "NumReplies" INTEGER,
    "DatePosted" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "RatingSum" BIGINT,
    "NumRatings" BIGINT,
    "Score" DECIMAL(19,9),
    "LastEditDate" TIMESTAMP,
    "SortOrder" INTEGER,
    "Depth" INTEGER,
    "Thread" VARCHAR,
    "WordCount" INTEGER,
    "AttachmentCount" INTEGER,
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
    "UserId" INTEGER,
    "PostId" BIGINT,
    "IsRead" BOOLEAN,
    "FirstReadDate" TIMESTAMP,
    "LastReadDate" TIMESTAMP,
    "Version" BIGINT
);

-- Discussion Topic User Scores
-- Primary key (informational, not enforced): UserId, TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "DiscussionTopicUserScores" (
    "UserId" INTEGER,
    "TopicId" BIGINT,
    "Score" DECIMAL(19,9),
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
    "OrgUnitId" INTEGER,
    "TopicId" BIGINT,
    "ForumId" BIGINT,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "LastPostDate" TIMESTAMP,
    "LastPostUserId" BIGINT,
    "NumViews" BIGINT,
    "SortOrder" INTEGER,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "GradeItemId" INTEGER,
    "ScoreOutOf" DOUBLE,
    "ScoreCalculationMethod" VARCHAR,
    "IncludeNonScoredValues" BOOLEAN,
    "Version" BIGINT,
    "ResultId" INTEGER,
    "StartDate" TIMESTAMP,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INTEGER,
    "DueDate" TIMESTAMP
);

-- Enrollments and Withdrawals
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "EnrollmentsAndWithdrawals" (
    "LogId" BIGINT,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "RoleId" INTEGER,
    "Action" VARCHAR,
    "ModifiedByUserId" INTEGER,
    "EnrollmentDate" TIMESTAMP
);

-- Grade Book Settings
-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeBookSettings" (
    "OrgUnitId" INTEGER,
    "GradeSchemeId" BIGINT,
    "GradingSystem" VARCHAR,
    "UngradedItems" VARCHAR,
    "IsAdjustedFinalGradeReleased" BOOLEAN,
    "IsCalculatedFinalGradeReleased" BOOLEAN,
    "LastModified" TIMESTAMP
);

-- Grade Objects
-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeObjects" (
    "GradeObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "ParentGradeObjectId" INTEGER,
    "Name" VARCHAR,
    "TypeName" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsAutoPointed" BOOLEAN,
    "IsFormula" BOOLEAN,
    "IsBonus" BOOLEAN,
    "MaxPoints" DECIMAL(19,9),
    "CanExceedMaxGrade" BOOLEAN,
    "ExcludeFromFinalGradeCalc" BOOLEAN,
    "GradeSchemeId" BIGINT,
    "Weight" DECIMAL(19,9),
    "NumLowestGradesToDrop" INTEGER,
    "NumHighestGradesToDrop" INTEGER,
    "WeightDistributionType" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "ToolName" VARCHAR,
    "AssociatedToolItemId" BIGINT,
    "LastModified" TIMESTAMP,
    "ShortName" VARCHAR,
    "GradeObjectTypeId" INTEGER,
    "SortOrder" INTEGER,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "ResultId" INTEGER,
    "ToolId" INTEGER,
    "Version" INTEGER
);

-- Grade Objects Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeObjectsLog" (
    "LogId" BIGINT,
    "Name" VARCHAR,
    "GradeObjectId" INTEGER,
    "UserId" INTEGER,
    "GradeSymbolString" VARCHAR,
    "PointsDenominator" DECIMAL(19,9),
    "PointsNumerator" DECIMAL(19,9),
    "WeightedDenominator" DECIMAL(19,9),
    "WeightedNumerator" DECIMAL(19,9),
    "Modified" TIMESTAMP,
    "ModifiedBy" INTEGER
);

-- Grade Results
-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "PointsNumerator" DECIMAL(19,9),
    "PointsDenominator" DECIMAL(19,9),
    "WeightedNumerator" DECIMAL(19,9),
    "WeightedDenominator" DECIMAL(19,9),
    "IsReleased" BOOLEAN,
    "IsDropped" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "Comments" VARCHAR,
    "PrivateComments" VARCHAR,
    "GradeText" VARCHAR,
    "GradeReleasedDate" TIMESTAMP,
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
    "SymbolString" VARCHAR,
    "AssignedValue" DECIMAL(19,9),
    "RangeStart" DECIMAL(19,9),
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);

-- Grade Schemes
-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeSchemes" (
    "GradeSchemeId" BIGINT,
    "OrgUnitId" INTEGER,
    "SchemeName" VARCHAR,
    "DeletedDate" TIMESTAMP,
    "Version" BIGINT
);

-- Intelligent Agent Objects
-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "IntelligentAgentObjects" (
    "AgentId" BIGINT,
    "OrgUnitId" INTEGER,
    "AgentName" VARCHAR,
    "Description" VARCHAR,
    "Enabled" BOOLEAN,
    "SpecificRoles" VARCHAR,
    "LoginConditionEnabled" BOOLEAN,
    "LoginConditionThreshold" INTEGER,
    "LoginConditionType" VARCHAR,
    "AccessConditionEnabled" BOOLEAN,
    "AccessConditionThreshold" INTEGER,
    "AccessConditionType" VARCHAR,
    "ResultId" BIGINT,
    "RepeatType" VARCHAR,
    "EmailWhenSatisfied" BOOLEAN,
    "EnableSchedule" BOOLEAN,
    "ScheduleType" VARCHAR,
    "ScheduleRepeatsEvery" INTEGER,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
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
    "NumUsers" INTEGER,
    "NumUsersWithErrors" INTEGER,
    "NumUsersWithInfos" INTEGER,
    "NumUsersWithWarnings" INTEGER,
    "RunUserId" INTEGER,
    "RunDate" TIMESTAMP
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
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "ActionTypeName" VARCHAR,
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
    "UserId" INTEGER,
    "MappingField" VARCHAR,
    "MappingFieldValue" VARCHAR,
    "ProviderType" VARCHAR,
    "ProviderId" VARCHAR,
    "RoleId" INTEGER,
    "Timestamp" TIMESTAMP,
    "Action" VARCHAR
);

-- Local Authentication Security Log
-- Primary key (informational, not enforced): UserId, Action, ModifiedBy, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LocalAuthenticationSecurityLog" (
    "UserId" INTEGER,
    "Action" VARCHAR,
    "ModifiedBy" INTEGER,
    "ModifiedDate" TIMESTAMP
);

-- LTI Advantage Deployment Audit
-- Primary key (informational, not enforced): DeploymentID, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageDeploymentAudit" (
    "Action" VARCHAR,
    "DeploymentID" VARCHAR,
    "ClientID" VARCHAR,
    "DeploymentName" VARCHAR,
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
    "Timestamp" TIMESTAMP,
    "HasAssetProcessor" BOOLEAN
);

-- LTI Advantage Registration Audit
-- Primary key (informational, not enforced): ClientId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTIAdvantageRegistrationAudit" (
    "Action" VARCHAR,
    "ClientId" VARCHAR,
    "ToolName" VARCHAR,
    "Domain" VARCHAR,
    "RedirectURLs" VARCHAR,
    "KeysetURL" VARCHAR,
    "LoginURL" VARCHAR,
    "LTIVersion" VARCHAR,
    "IsRegistrationEnabled" BOOLEAN,
    "SendInstitutionRole" BOOLEAN,
    "TargetLinkURI" VARCHAR,
    "ModifiedBy" BIGINT,
    "HasAssignmentAndGradeServices" BOOLEAN,
    "HasSubmissionReview" BOOLEAN,
    "HasDeepLinking" BOOLEAN,
    "HasNamesAndRoleProvisioningServices" BOOLEAN,
    "HasActivityItemProfile" BOOLEAN,
    "HasPlatformNotificationService" BOOLEAN,
    "Timestamp" TIMESTAMP,
    "HasAssetProcessor" BOOLEAN
);

-- LTI Launches
-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" UUID,
    "UserId" INTEGER,
    "IMSRoleNames" VARCHAR,
    "ImpersonatingUserId" BIGINT,
    "ImpersonatingUserIMSRoleNames" VARCHAR,
    "LaunchDate" TIMESTAMP,
    "OrgUnitId" BIGINT,
    "LTILinkId" BIGINT,
    "DeploymentId" UUID,
    "ClientId" UUID,
    "ToolProviderId" VARCHAR,
    "ContentTopicId" BIGINT,
    "ParentModuleId" BIGINT,
    "Placement" VARCHAR,
    "MessageVersion" VARCHAR,
    "RequestType" VARCHAR
);

-- LTI Link Migration Audit
-- Primary key (informational, not enforced): LTIMigrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "LTILinkMigrationAudit" (
    "LTIMigrationId" UUID,
    "UserId" BIGINT,
    "MigrationDate" TIMESTAMP,
    "OrgUnitId" BIGINT,
    "LinkId" BIGINT,
    "LinkURL" VARCHAR,
    "LinkName" VARCHAR,
    "ClientId" VARCHAR,
    "RegistrationDomain" VARCHAR,
    "DeploymentId" UUID,
    "JobId" BIGINT,
    "Status" SMALLINT,
    "FailureCode" SMALLINT,
    "MigrationType" SMALLINT,
    "LegacyURL" VARCHAR
);

-- LTI Links
-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "LTILinks" (
    "LtiLinkId" BIGINT,
    "OrgUnitId" INTEGER,
    "Title" VARCHAR,
    "LinkType" INTEGER,
    "LTIVersion" VARCHAR,
    "Url" VARCHAR,
    "Description" VARCHAR,
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
    "LastModifiedDate" TIMESTAMP,
    "OuAvailabilitySetId" BIGINT,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "DeploymentId" UUID,
    "LinkSubType" INTEGER
);

-- Media Consumption Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "MediaConsumptionLog" (
    "LogId" UUID,
    "UserId" INTEGER,
    "ContentId" UUID,
    "RevisionId" UUID,
    "ContentType" VARCHAR,
    "ClientApp" VARCHAR,
    "DateConsumed" TIMESTAMP,
    "DurationPercentageWatched" INTEGER
);

-- Media Objects
-- Primary key (informational, not enforced): ContentId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "MediaObjects" (
    "ContentId" UUID,
    "Title" VARCHAR,
    "RevisionCount" INTEGER,
    "OwnerId" INTEGER,
    "LastModified" TIMESTAMP
);

-- Organizational Unit Ancestors
-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitAncestors" (
    "OrgUnitId" INTEGER,
    "AncestorOrgUnitId" INTEGER,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP
);

-- Organizational Unit Descendants
-- Primary key (informational, not enforced): OrgUnitId, DescendantOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitDescendants" (
    "OrgUnitId" INTEGER,
    "DescendantOrgUnitId" INTEGER,
    "LastModified" TIMESTAMP,
    "DateDeleted" TIMESTAMP
);

-- Organizational Unit Parents
-- Primary key (informational, not enforced): OrgUnitId, ParentOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitParents" (
    "OrgUnitId" INTEGER,
    "ParentOrgUnitId" INTEGER,
    "RowVersion" BIGINT,
    "DateDeleted" TIMESTAMP
);

-- Organizational Unit Recent Access
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "OrganizationalUnitRecentAccess" (
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "LastAccessedDate" TIMESTAMP
);

-- Organizational Units
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "OrganizationalUnits" (
    "OrgUnitId" INTEGER,
    "Organization" VARCHAR,
    "Type" VARCHAR,
    "Name" VARCHAR,
    "Code" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsActive" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "RecycledDate" TIMESTAMP,
    "Version" BIGINT,
    "OrgUnitTypeId" INTEGER
);

-- Outcome Details
-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomeDetails" (
    "OutcomeId" UUID,
    "OutcomeDefinitionSource" VARCHAR,
    "OutcomeDefinitionId" VARCHAR,
    "ParentOutcomeId" UUID,
    "Description" VARCHAR,
    "Notation" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);

-- Outcomes Aligned to Tool Objects
-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesAlignedToToolObjects" (
    "ObjectType" INTEGER,
    "ObjectId" VARCHAR,
    "OutcomeId" UUID,
    "RegistryId" UUID,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "AIUtilization" INTEGER
);

-- Outcomes Assessed Checkpoints
-- Primary key (informational, not enforced): CheckpointId, DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DemonstrationId -> OutcomesDemonstrations.DemonstrationId
CREATE TABLE IF NOT EXISTS "OutcomesAssessedCheckpoints" (
    "CheckpointId" UUID,
    "DemonstrationId" UUID,
    "Feedback" VARCHAR,
    "ConfigDecayRate" INTEGER,
    "ConfigAggregationMethod" INTEGER,
    "ConfigIncludedActivities" INTEGER,
    "ConfigMultipleAttemptStrategy" INTEGER,
    "ConfigRecentlyAssessedActivityCount" INTEGER,
    "ConfigTieBreaker" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "HasMetAchievementThreshold" BOOLEAN,
    "AchievedLevelId" UUID
);

-- Outcomes Course Specific Scales
-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesCourseSpecificScales" (
    "OrgUnitId" INTEGER,
    "RegistryId" UUID,
    "ScaleId" UUID,
    "AchievementThreshold" UUID,
    "CreatedDate" TIMESTAMP,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);

-- Outcomes Demonstrations
-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesDemonstrations" (
    "DemonstrationId" UUID,
    "ExplicitlyEnteredScaleLevelId" UUID,
    "AutomaticallyGeneratedScaleLevelId" UUID,
    "AlignedObjectType" INTEGER,
    "AlignedObjectId" VARCHAR,
    "OutcomeId" UUID,
    "RegistryId" UUID,
    "IsPublished" BOOLEAN,
    "AssessedUserId" INTEGER,
    "AssessedDate" TIMESTAMP,
    "AssessorUserId" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);

-- Outcomes in Registries
-- Primary key (informational, not enforced): OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
CREATE TABLE IF NOT EXISTS "OutcomesInRegistries" (
    "OutcomeId" UUID,
    "RegistryId" UUID,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
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
    "OutcomeId" UUID,
    "RegistryId" UUID,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);

-- Outcomes Scale Definition
-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesScaleDefinition" (
    "ScaleId" UUID,
    "Name" VARCHAR,
    "IsDefault" BOOLEAN,
    "UsePercentages" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "AchievementThreshold" UUID
);

-- Outcomes Scale Level Definition
-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesScaleLevelDefinition" (
    "ScaleLevelId" UUID,
    "ScaleId" UUID,
    "Name" VARCHAR,
    "SortOrder" INTEGER,
    "PercentageRangeStart" INTEGER,
    "RGB" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER
);

-- Outcomes Set Course
-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetCourse" (
    "RegistryId" UUID,
    "OrgUnitId" BIGINT,
    "SourceOutcomeSetId" BIGINT,
    "IsPrimary" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "ScaleId" UUID,
    "AchievementThreshold" UUID
);

-- Outcomes Set Org
-- Primary key (informational, not enforced): OutcomeSetId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesSetOrg" (
    "OutcomeSetId" BIGINT,
    "OutcomeSetName" VARCHAR,
    "RegistryId" UUID,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "ScaleId" UUID
);

-- Portfolio Categories
-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioCategories" (
    "CategoryId" UUID,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "IsRetired" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER
);

-- Portfolio Evidence Categories
-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceCategories" (
    "CategoryId" UUID,
    "EvidenceId" UUID,
    "Group" VARCHAR,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER
);

-- Portfolio Evidence Log
-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceLog" (
    "LogId" UUID,
    "ParentObjectId" UUID,
    "ObjectId" UUID,
    "ObjectType" VARCHAR,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "Action" VARCHAR,
    "IsMobile" BOOLEAN,
    "ActionDate" TIMESTAMP
);

-- Portfolio Evidence Objects
-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceObjects" (
    "EvidenceId" UUID,
    "OwnerId" INTEGER,
    "OrgUnitId" INTEGER,
    "EvidenceType" VARCHAR,
    "Title" VARCHAR,
    "IsApproved" BOOLEAN,
    "IsSpotlighted" BOOLEAN,
    "IsSharedToParents" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "IsRecoverableByInstructor" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsSharedWithInstructor" BOOLEAN,
    "DateSharedWithInstructor" TIMESTAMP
);

-- PreRequisite Conditions Met
-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PreRequisiteConditionsMet" (
    "PreRequisiteId" INTEGER,
    "UserId" INTEGER,
    "DateMet" TIMESTAMP,
    "Action" VARCHAR,
    "LastModified" TIMESTAMP
);

-- Question Answer Options
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId, AnswerOptionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswerOptions" (
    "AnswerId" BIGINT,
    "AnswerText" VARCHAR,
    "Weight" DECIMAL(19,9),
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerOptionId" INTEGER
);

-- Question Answers
-- Primary key (informational, not enforced): AnswerId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionAnswers" (
    "AnswerId" BIGINT,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "SortOrder" INTEGER,
    "Weight" DECIMAL(19,9),
    "Answer" VARCHAR,
    "Comment" VARCHAR,
    "Description" VARCHAR
);

-- Question Library
-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionLibrary" (
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "IsAutoGraded" BOOLEAN,
    "TemplateTypeId" INTEGER,
    "QuestionType" VARCHAR,
    "Name" VARCHAR,
    "Question" VARCHAR,
    "Comment" VARCHAR,
    "AnswerKey" VARCHAR,
    "CreationDate" TIMESTAMP,
    "Version" BIGINT,
    "AllowsAttachments" BOOLEAN,
    "AIUtilization" INTEGER
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
    "CreationDate" TIMESTAMP,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" BIGINT,
    "Points" DECIMAL(19,9),
    "Difficulty" INTEGER,
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
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "AttemptNumber" INTEGER,
    "TimeStarted" TIMESTAMP,
    "TimeCompleted" TIMESTAMP,
    "Score" DECIMAL(19,9),
    "IsGraded" BOOLEAN,
    "OldAttemptNumber" INTEGER,
    "IsDeleted" BOOLEAN,
    "PossibleScore" DECIMAL(19,9),
    "IsRetakeIncorrectOnly" BOOLEAN,
    "DueDate" TIMESTAMP,
    "TimeLimit" INTEGER,
    "TimeLimitEnforced" BOOLEAN,
    "TimeLimitExceededBehaviour" VARCHAR,
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INTEGER,
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
    "EventTypeId" INTEGER,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "EventTime" TIMESTAMP,
    "IPAddress" VARCHAR,
    "UserId" INTEGER,
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
    "QuizName" VARCHAR,
    "QuizDescription" VARCHAR,
    "QuizCategory" VARCHAR,
    "IsActive" BOOLEAN,
    "OrgUnitId" INTEGER,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "CreationDate" TIMESTAMP,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" BIGINT,
    "GradeObjectId" BIGINT,
    "OverallScoreCalculation" VARCHAR,
    "QuizScoreDenominator" DECIMAL(19,9),
    "HasPassword" BOOLEAN,
    "IPRestricted" BOOLEAN,
    "TimeLimit" INTEGER,
    "TimeLimitEnforced" BOOLEAN,
    "AttemptsAllowed" INTEGER,
    "PreventMovingBackwards" BOOLEAN,
    "AllowHints" BOOLEAN,
    "NotificationEmail" VARCHAR,
    "DisablePagerAccess" BOOLEAN,
    "DisplayInCalendar" BOOLEAN,
    "IsAttemptRldb" BOOLEAN,
    "IsSubviewRldb" BOOLEAN,
    "SortOrder" INTEGER,
    "CategoryId" BIGINT,
    "ResultId" BIGINT,
    "IsRetakeIncorrectOnly" BOOLEAN,
    "PagingTypeId" INTEGER,
    "IsSynchronous" BOOLEAN,
    "DeductionPercentage" INTEGER,
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
    "Name" VARCHAR,
    "NameIsDisplayed" BOOLEAN,
    "IsQuestionPool" BOOLEAN,
    "SectionText" VARCHAR,
    "SectionTextIsHTML" BOOLEAN,
    "IsSectionTextHidden" BOOLEAN,
    "QuestionPoints" DECIMAL(19,9),
    "NumQuestions" INTEGER,
    "NumChoices" INTEGER,
    "Shuffle" BOOLEAN,
    "CreationDate" TIMESTAMP,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP,
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
    "AttemptNumber" INTEGER,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerId" BIGINT,
    "SortOrder" INTEGER,
    "IsCorrect" BOOLEAN,
    "UserSelection" BIGINT,
    "UserAnswer" VARCHAR,
    "FileSetId" BIGINT,
    "LastModified" TIMESTAMP,
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
    "TimeCompleted" TIMESTAMP,
    "QuestionNumber" INTEGER,
    "Comment" VARCHAR,
    "SortOrder" INTEGER,
    "Score" DECIMAL(19,9),
    "Page" INTEGER,
    "SectionId" BIGINT,
    "ObjectId" BIGINT,
    "OutOf" DECIMAL(19,9),
    "TimeStarted" TIMESTAMP,
    "IsBonus" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "QuizTimeCompleted" TIMESTAMP
);

-- Release Condition Objects
-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ReleaseConditionObjects" (
    "PreRequisiteId" INTEGER,
    "ResultId" INTEGER,
    "OrgUnitId" INTEGER,
    "Name" VARCHAR,
    "IsNegativeCondition" BOOLEAN,
    "PreRequisiteToolId" INTEGER,
    "Id1" INTEGER,
    "Id2" INTEGER,
    "ResultToolId" INTEGER,
    "UsesPercentage" BOOLEAN,
    "OperatorTypeDesc" VARCHAR,
    "Version" BIGINT,
    "Guid1" UUID,
    "Guid2" UUID
);

-- Release Condition Results
-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReleaseConditionResults" (
    "ResultId" INTEGER,
    "UserId" INTEGER,
    "Met" VARCHAR,
    "Version" BIGINT,
    "DeletedDate" TIMESTAMP
);

-- Reoffer Course
-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "ReofferCourse" (
    "CourseOfferingId" INTEGER,
    "SourceCourseId" INTEGER,
    "CreatedBy" INTEGER,
    "ReofferDate" TIMESTAMP
);

-- Role Details
-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "RoleDetails" (
    "RoleId" INTEGER,
    "RoleName" VARCHAR,
    "Description" VARCHAR,
    "IsCascading" BOOLEAN,
    "InClassList" BOOLEAN,
    "ClassListRoleName" VARCHAR,
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
    "SortOrder" INTEGER,
    "ShowInContent" BOOLEAN,
    "ShowInDiscussionAssess" BOOLEAN,
    "ShowInDiscussionStats" BOOLEAN,
    "ShowInGrades" BOOLEAN,
    "ShowInAttendance" BOOLEAN,
    "AllowSelfEnrollInGroups" BOOLEAN,
    "ShowInRegistration" BOOLEAN,
    "ShowInUserProgress" BOOLEAN,
    "RoleAlias" VARCHAR,
    "RoleCode" VARCHAR,
    "LastModifiedDate" TIMESTAMP,
    "DeletedBy" INTEGER
);

-- Rubric Assessment
-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "RubricAssessment" (
    "RubricId" BIGINT,
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "Score" DECIMAL(36,2),
    "AssessedByUserId" INTEGER,
    "AssessmentDate" TIMESTAMP,
    "IsCompleted" BOOLEAN,
    "ActivityType" VARCHAR,
    "ActivityObjectId" BIGINT,
    "DateCreated" TIMESTAMP,
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
    "Score" DECIMAL(19,9),
    "Feedback" VARCHAR,
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
    "Description" VARCHAR,
    "Feedback" VARCHAR,
    "Value" DECIMAL(19,9),
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
    "Name" VARCHAR,
    "SortOrder" INTEGER,
    "CriteriaGroupId" BIGINT,
    "GroupName" VARCHAR,
    "GroupSortOrder" INTEGER,
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
    "Name" VARCHAR,
    "Description" VARCHAR,
    "Feedback" VARCHAR,
    "Value" DECIMAL(19,9),
    "RangeStartValue" DECIMAL(19,9),
    "SortOrder" INTEGER,
    "LevelSetId" BIGINT,
    "IsDeleted" BOOLEAN
);

-- Rubric Objects
-- Primary key (informational, not enforced): RubricId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitID -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "RubricObjects" (
    "RubricId" BIGINT,
    "Name" VARCHAR,
    "RubricStatus" VARCHAR,
    "Description" VARCHAR,
    "RubricType" VARCHAR,
    "ScoringMethods" VARCHAR,
    "IsScoreVisible" BOOLEAN,
    "OrgUnitID" INTEGER,
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
    "AuditLogId" UUID,
    "RubricId" BIGINT,
    "CriterionId" BIGINT,
    "LevelId" BIGINT,
    "ModifiedBy" INTEGER,
    "ModifiedObjectType" INTEGER,
    "CriteriaGroupId" BIGINT,
    "ModifiedDate" TIMESTAMP,
    "PreviousValue" VARCHAR,
    "ModifiedValue" VARCHAR,
    "IsLocked" BOOLEAN,
    "Version" INTEGER
);

-- SCORM Activities
-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMActivities" (
    "ActivityId" UUID,
    "ScormObjectId" UUID,
    "ParentActivityId" UUID,
    "NumChildren" INTEGER,
    "InternalId" VARCHAR,
    "Title" VARCHAR,
    "CompletionThreshold" REAL,
    "PassingScore" REAL,
    "PassingScoreUsed" BOOLEAN,
    "ScoreMin" REAL,
    "ScoreMax" REAL,
    "LastModified" TIMESTAMP
);

-- SCORM Activity Attempts
-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMActivityAttempts" (
    "VisitId" UUID,
    "ActivityId" UUID,
    "AttemptNumber" INTEGER,
    "Completion" VARCHAR,
    "Success" VARCHAR,
    "Score" REAL,
    "ScoreRaw" REAL,
    "TimeSpent" REAL,
    "Progress" REAL,
    "LastModified" TIMESTAMP
);

-- SCORM Interaction Attempts
-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMInteractionAttempts" (
    "VisitId" UUID,
    "InteractionId" UUID,
    "AttemptNumber" INTEGER,
    "ActivityId" UUID,
    "Timestamp" TIMESTAMP,
    "Response" VARCHAR,
    "Result" VARCHAR,
    "NumericResult" REAL,
    "TimeSpent" REAL,
    "LastModified" TIMESTAMP
);

-- SCORM Interaction Objectives
-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS "SCORMInteractionObjectives" (
    "InteractionId" UUID,
    "ObjectiveId" UUID,
    "LastModified" TIMESTAMP
);

-- SCORM Interactions
-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS "SCORMInteractions" (
    "InteractionId" UUID,
    "ActivityId" UUID,
    "InternalId" VARCHAR,
    "InteractionType" VARCHAR,
    "Description" VARCHAR,
    "Weighting" REAL,
    "CorrectResponses" VARCHAR,
    "LastModified" TIMESTAMP
);

-- SCORM Objective Attempts
-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
CREATE TABLE IF NOT EXISTS "SCORMObjectiveAttempts" (
    "VisitId" UUID,
    "ObjectiveId" UUID,
    "AttemptNumber" INTEGER,
    "Score" REAL,
    "ScoreRaw" REAL,
    "Success" VARCHAR,
    "Completion" VARCHAR,
    "Progress" REAL,
    "LastModified" TIMESTAMP
);

-- SCORM Objectives
-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
CREATE TABLE IF NOT EXISTS "SCORMObjectives" (
    "ObjectiveId" UUID,
    "ScormObjectId" UUID,
    "ObjectiveType" VARCHAR,
    "ActivityId" UUID,
    "InternalId" VARCHAR,
    "IsPrimary" BOOLEAN,
    "Description" VARCHAR,
    "ScoreMin" REAL,
    "ScoreMax" REAL,
    "LastModified" TIMESTAMP
);

-- SCORM Objects
-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SCORMObjects" (
    "ScormObjectId" UUID,
    "OrgUnitId" INTEGER,
    "ContentObjectId" INTEGER,
    "ContentServiceContentId" UUID,
    "ContentServiceRevisionId" UUID,
    "ContentServiceTopicId" UUID,
    "Title" VARCHAR,
    "Description" VARCHAR,
    "LearningStandard" VARCHAR,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER
);

-- SCORM Visits
-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SCORMVisits" (
    "VisitId" UUID,
    "ScormObjectId" UUID,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "FirstAccessDate" TIMESTAMP,
    "LastAccessDate" TIMESTAMP,
    "CompletedDate" TIMESTAMP,
    "Completion" VARCHAR,
    "Success" VARCHAR,
    "Score" REAL,
    "TimeSpent" INTEGER,
    "Progress" REAL,
    "LastModified" TIMESTAMP
);

-- Session History
-- Primary key (informational, not enforced): HistoryID
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SessionHistory" (
    "SessionId" BIGINT,
    "OrgId" INTEGER,
    "UserId" INTEGER,
    "DateStarted" TIMESTAMP,
    "DateEnded" TIMESTAMP,
    "LastAccessed" TIMESTAMP,
    "TimedOut" BOOLEAN,
    "HistoryID" BIGINT
);

-- SIS Course Merge Log
-- Primary key (informational, not enforced): BatchId, OriginalSourceOrgUnitId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SISCourseMergeLog" (
    "BatchId" UUID,
    "JobType" VARCHAR,
    "Status" VARCHAR,
    "OriginalTargetOrgUnitId" BIGINT,
    "OriginalSourceOrgUnitId" BIGINT,
    "SourceSystemId" BIGINT,
    "NumberOfCoursesInBatch" INTEGER,
    "UserId" BIGINT,
    "ErrorType" VARCHAR,
    "Timestamp" TIMESTAMP
);

-- Source Course Deploy History
-- Primary key (informational, not enforced): SourceCourseDeployId, SourceCourseOrgUnitId, TargetCourseOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SourceCourseDeployHistory" (
    "SourceCourseDeployId" BIGINT,
    "SourceCourseOrgUnitId" INTEGER,
    "TargetCourseOrgUnitId" INTEGER,
    "UserId" INTEGER,
    "Status" VARCHAR,
    "QueuedTime" TIMESTAMP,
    "CompletionTime" TIMESTAMP
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
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "AttemptNumber" INTEGER,
    "TimeStarted" TIMESTAMP,
    "TimeCompleted" TIMESTAMP,
    "AttemptedFromOrgUnitId" INTEGER,
    "OldAttemptNumber" INTEGER,
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
    "SurveyName" VARCHAR,
    "CategoryId" BIGINT,
    "OrgUnitId" INTEGER,
    "Description" VARCHAR,
    "DescriptionEnabled" BOOLEAN,
    "HasInstantFeedback" BOOLEAN,
    "IsAnonymous" BOOLEAN,
    "IsVisible" BOOLEAN,
    "SubmissionMessage" VARCHAR,
    "Footer" VARCHAR,
    "FooterIsDisplayed" BOOLEAN,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DisplayInCalendar" BOOLEAN,
    "ResultId" BIGINT,
    "AttemptsAllowed" INTEGER,
    "SortOrder" INTEGER,
    "CreatedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "Version" BIGINT,
    "CategoryName" VARCHAR
);

-- Survey User Answer Responses
-- Primary key (informational, not enforced): AttemptId, QuestionId, QuestionVersionId, AnswerId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttemptId -> SurveyAttempts.AttemptId
CREATE TABLE IF NOT EXISTS "SurveyUserAnswerResponses" (
    "AttemptId" BIGINT,
    "AttemptNumber" INTEGER,
    "QuestionId" BIGINT,
    "QuestionVersionId" BIGINT,
    "AnswerId" BIGINT,
    "SortOrder" BIGINT,
    "IsCorrect" BOOLEAN,
    "UserSelection" BIGINT,
    "UserAnswer" VARCHAR,
    "FileSetId" BIGINT,
    "LastModified" TIMESTAMP,
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
    "TimeCompleted" TIMESTAMP,
    "QuestionNumber" INTEGER,
    "Comment" VARCHAR,
    "SortOrder" INTEGER,
    "Score" DECIMAL(19,9),
    "Page" INTEGER,
    "Assigned" BOOLEAN,
    "IsDeleted" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "SurveyTimeCompleted" TIMESTAMP
);

-- System Access Log
-- Primary key (informational, not enforced): SessionId, UserId, Timestamp, State
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessLog" (
    "SessionId" VARCHAR,
    "UserId" INTEGER,
    "Timestamp" TIMESTAMP,
    "State" VARCHAR,
    "Source" VARCHAR,
    "AppVersion" VARCHAR,
    "Device" VARCHAR,
    "IsOfflineMode" BOOLEAN,
    "IPAddress" VARCHAR
);

-- System Access Summary
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SystemAccessSummary" (
    "UserId" INTEGER,
    "ImpersonatingUserId" INTEGER,
    "LastSystemAccess" TIMESTAMP,
    "Source" VARCHAR
);

-- Tools
-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Tools" (
    "ToolId" INTEGER,
    "Name" VARCHAR,
    "DisplayName" VARCHAR,
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
    "LastSubmissionDate" TIMESTAMP,
    "SubmissionStatus" SMALLINT,
    "SubmissionErrorType" SMALLINT,
    "ErrorMessage" VARCHAR,
    "SubmittedBy" INTEGER,
    "LastRefreshDate" TIMESTAMP,
    "LastModified" TIMESTAMP
);

-- User Attribute Definitions
-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserAttributeDefinitions" (
    "AttributeId" VARCHAR,
    "Name" VARCHAR,
    "Type" VARCHAR,
    "AllowMultiple" BOOLEAN,
    "IsDefault" BOOLEAN,
    "LastModified" TIMESTAMP,
    "ModifiedBy" INTEGER,
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
    "UserId" INTEGER,
    "AttributeId" VARCHAR,
    "Value" VARCHAR,
    "LastModified" TIMESTAMP,
    "ModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "Version" INTEGER
);

-- User Enrollments
-- Primary key (informational, not enforced): OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserEnrollments" (
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "RoleName" VARCHAR,
    "EnrollmentDate" TIMESTAMP,
    "EnrollmentType" VARCHAR,
    "RoleId" INTEGER
);

-- User Logins
-- Primary key (informational, not enforced): LoginAttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "UserLogins" (
    "UserId" INTEGER,
    "UserName" VARCHAR,
    "IP" VARCHAR,
    "SessionId" INTEGER,
    "StatusType" VARCHAR,
    "AttemptDate" TIMESTAMP,
    "ImpersonatingUserId" INTEGER,
    "LoginAttemptId" VARCHAR,
    "LoginSource" VARCHAR
);

-- Users
-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" INTEGER,
    "UserName" VARCHAR,
    "OrgDefinedId" VARCHAR,
    "FirstName" VARCHAR,
    "MiddleName" VARCHAR,
    "LastName" VARCHAR,
    "IsActive" BOOLEAN,
    "ExternalEmail" VARCHAR,
    "CreationDate" TIMESTAMP,
    "Version" BIGINT,
    "OrgRoleId" INTEGER,
    "DateDeleted" TIMESTAMP
);

-- Virtual Classroom Usage
-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" INTEGER,
    "CourseName" VARCHAR,
    "MeetingId" VARCHAR,
    "MeetingName" VARCHAR,
    "CreationUserId" INTEGER,
    "CreationDate" TIMESTAMP,
    "ScheduledDate" TIMESTAMP,
    "ScheduledDuration" INTEGER,
    "IsPublished" BOOLEAN,
    "ExternalLinksEnabled" BOOLEAN,
    "WholeClassInvited" BOOLEAN,
    "IsCancelled" BOOLEAN,
    "StartDateTime" TIMESTAMP,
    "EndDateTime" TIMESTAMP,
    "IsRecorded" BOOLEAN
);
