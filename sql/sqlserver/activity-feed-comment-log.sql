-- Activity Feed Comment Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): PostId -> ActivityFeedPostObjects.PostId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[ActivityFeedCommentLog]', N'U') IS NULL
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
