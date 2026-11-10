-- Discussion Posts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): TopicId -> DiscussionTopics.TopicId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[DiscussionPosts]', N'U') IS NULL
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
