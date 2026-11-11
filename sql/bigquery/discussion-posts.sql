-- Discussion Posts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

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
