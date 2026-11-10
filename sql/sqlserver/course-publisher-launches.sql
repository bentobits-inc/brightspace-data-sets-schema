-- Course Publisher Launches
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CoursePublisherLaunches];
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
