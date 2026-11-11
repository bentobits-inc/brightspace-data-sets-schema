-- Discussion Posts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

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
