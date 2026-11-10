-- LTI Launches
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[LTILaunches];
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
