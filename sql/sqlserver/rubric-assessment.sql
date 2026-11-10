-- Rubric Assessment
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[RubricAssessment]', N'U') IS NULL
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
