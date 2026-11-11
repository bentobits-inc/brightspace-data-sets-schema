-- Activity Feed Post Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `ActivityFeedPostObjects` (
    `OrgUnitId` INT64,
    `PostId` STRING(36),
    `PostType` STRING(16),
    `LastModifiedBy` INT64,
    `LastModified` DATETIME,
    `DropboxId` INT64,
    `Content` STRING(3072),
    `IsDeleted` BOOL,
    `CommentCount` INT64,
    `AttachmentCount` INT64,
    `Version` INT64
);
