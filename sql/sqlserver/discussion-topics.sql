-- Discussion Topics
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

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
