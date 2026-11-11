-- Discussion Posts Read Status
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

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
