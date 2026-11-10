-- Users
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[Users];
CREATE TABLE [dbo].[Users] (
    [UserId] int NULL,
    [UserName] nvarchar(270) NULL,
    [OrgDefinedId] nvarchar(256) NULL,
    [FirstName] nvarchar(64) NULL,
    [MiddleName] nvarchar(64) NULL,
    [LastName] nvarchar(64) NULL,
    [IsActive] bit NULL,
    [ExternalEmail] nvarchar(256) NULL,
    [CreationDate] datetime2 NULL,
    [Version] bigint NULL,
    [OrgRoleId] int NULL,
    [DateDeleted] datetime2 NULL
);
