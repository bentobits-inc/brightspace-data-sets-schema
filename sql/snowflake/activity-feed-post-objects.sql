-- Activity Feed Post Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostObjects" (
    "OrgUnitId" INT,
    "PostId" VARCHAR(36),
    "PostType" VARCHAR(16),
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ,
    "DropboxId" BIGINT,
    "Content" VARCHAR(3072),
    "IsDeleted" BOOLEAN,
    "CommentCount" INT,
    "AttachmentCount" INT,
    "Version" BIGINT
);
