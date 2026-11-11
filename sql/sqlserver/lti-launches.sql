-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
IF OBJECT_ID(N'[dbo].[LTILaunches]', N'U') IS NULL
CREATE TABLE [dbo].[LTILaunches] (
    [LTILaunchId] uniqueidentifier NULL,
    [UserId] int NULL,
    [IMSRoleNames] nvarchar(max) NULL,
    [ImpersonatingUserId] bigint NULL,
    [ImpersonatingUserIMSRoleNames] nvarchar(max) NULL,
    [LaunchDate] datetime2 NULL,
    [OrgUnitId] bigint NULL,
    [LTILinkId] bigint NULL,
    [DeploymentId] uniqueidentifier NULL,
    [ClientId] uniqueidentifier NULL,
    [ToolProviderId] nvarchar(300) NULL,
    [ContentTopicId] bigint NULL,
    [ParentModuleId] bigint NULL,
    [Placement] nvarchar(10) NULL,
    [MessageVersion] nvarchar(10) NULL,
    [RequestType] nvarchar(30) NULL
);
