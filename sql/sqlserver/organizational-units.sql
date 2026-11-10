-- Organizational Units
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[OrganizationalUnits]', N'U') IS NULL
CREATE TABLE [dbo].[OrganizationalUnits] (
    [OrgUnitId] int NULL,
    [Organization] nvarchar(50) NULL,
    [Type] nvarchar(50) NULL,
    [Name] nvarchar(128) NULL,
    [Code] nvarchar(50) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsActive] bit NULL,
    [CreatedDate] datetime2 NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [RecycledDate] datetime2 NULL,
    [Version] bigint NULL,
    [OrgUnitTypeId] int NULL
);
