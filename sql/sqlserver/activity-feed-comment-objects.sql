-- Activity Feed Comment Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CommentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
IF OBJECT_ID(N'[dbo].[ActivityFeedCommentObjects]', N'U') IS NULL
CREATE TABLE [dbo].[ActivityFeedCommentObjects] (
    [OrgUnitId] int NULL,
    [CommentId] uniqueidentifier NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [Content] nvarchar(3072) NULL,
    [IsDeleted] bit NULL,
    [PostId] uniqueidentifier NULL,
    [Version] bigint NULL
);
