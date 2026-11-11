-- Activity Feed Comment Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
CREATE TABLE IF NOT EXISTS "ActivityFeedCommentObjects" (
    "OrgUnitId" INT,
    "CommentId" VARCHAR(36),
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ,
    "Content" VARCHAR(3072),
    "IsDeleted" BOOLEAN,
    "PostId" VARCHAR(36),
    "Version" BIGINT
);
