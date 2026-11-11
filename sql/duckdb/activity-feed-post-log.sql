-- Activity Feed Post Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ActivityFeedPostLog" (
    "LogId" UUID,
    "UserId" INTEGER,
    "OrgUnitId" INTEGER,
    "PostId" UUID,
    "PostType" VARCHAR,
    "Action" VARCHAR,
    "ActionDate" TIMESTAMP,
    "DropboxId" BIGINT,
    "Content" VARCHAR,
    "CommentCount" INTEGER,
    "AttachmentCount" INTEGER
);
