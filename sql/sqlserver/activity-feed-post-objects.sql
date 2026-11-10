-- Activity Feed Post Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PostId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[ActivityFeedPostObjects]', N'U') IS NULL
CREATE TABLE [dbo].[ActivityFeedPostObjects] (
    [OrgUnitId] int NULL,
    [PostId] uniqueidentifier NULL,
    [PostType] nvarchar(16) NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [DropboxId] bigint NULL,
    [Content] nvarchar(3072) NULL,
    [IsDeleted] bit NULL,
    [CommentCount] int NULL,
    [AttachmentCount] int NULL,
    [Version] bigint NULL
);
