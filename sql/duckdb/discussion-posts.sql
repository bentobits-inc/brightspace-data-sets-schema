-- Discussion Posts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

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
