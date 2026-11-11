-- Activity Feed Comment Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentLog" (
    "LogId" VARCHAR(36),
    "UserId" INT,
    "OrgUnitId" INT,
    "CommentId" VARCHAR(36),
    "Action" VARCHAR(16),
    "ActionDate" TIMESTAMP_NTZ,
    "Content" VARCHAR(3072),
    "PostId" VARCHAR(36)
);
