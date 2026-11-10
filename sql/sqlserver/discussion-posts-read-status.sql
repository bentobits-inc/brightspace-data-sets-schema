-- Discussion Posts Read Status
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

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
