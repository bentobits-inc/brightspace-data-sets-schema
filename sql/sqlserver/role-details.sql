-- Role Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[RoleDetails]', N'U') IS NULL
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
