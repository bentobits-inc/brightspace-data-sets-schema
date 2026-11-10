-- JIT Provisioned Users Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[JITProvisionedUsersLog];
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
