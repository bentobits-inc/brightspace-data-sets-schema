-- Course Publisher Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[CoursePublisherLaunches]', N'U') IS NULL
CREATE TABLE [dbo].[CoursePublisherLaunches] (
    [LaunchId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [RecipientId] uniqueidentifier NULL,
    [UserId] int NULL,
    [RoleId] int NULL,
    [LaunchMethod] nvarchar(256) NULL,
    [ExternalUserId] nvarchar(256) NULL,
    [ExternalLMSType] nvarchar(256) NULL,
    [IsNewUser] bit NULL,
    [LastModified] datetime2 NULL
);
