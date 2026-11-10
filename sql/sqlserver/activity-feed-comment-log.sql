-- Activity Feed Comment Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ActivityFeedCommentLog];
CREATE TABLE [dbo].[ActivityFeedCommentLog] (
    [LogId] uniqueidentifier NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [CommentId] uniqueidentifier NULL,
    [Action] nvarchar(16) NULL,
    [ActionDate] datetime2 NULL,
    [Content] nvarchar(3072) NULL,
    [PostId] uniqueidentifier NULL
);
