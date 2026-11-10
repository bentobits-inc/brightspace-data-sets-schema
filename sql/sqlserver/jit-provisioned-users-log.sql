-- JIT Provisioned Users Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[JITProvisionedUsersLog]', N'U') IS NULL
CREATE TABLE [dbo].[JITProvisionedUsersLog] (
    [UserId] int NULL,
    [MappingField] nvarchar(32) NULL,
    [MappingFieldValue] nvarchar(270) NULL,
    [ProviderType] nvarchar(32) NULL,
    [ProviderId] nvarchar(1024) NULL,
    [RoleId] int NULL,
    [Timestamp] datetime2 NULL,
    [Action] nvarchar(16) NULL
);
