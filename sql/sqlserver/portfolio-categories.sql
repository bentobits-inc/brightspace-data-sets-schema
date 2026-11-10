-- Portfolio Categories
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[PortfolioCategories];
CREATE TABLE [dbo].[PortfolioCategories] (
    [CategoryId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [Name] nvarchar(256) NULL,
    [IsRetired] bit NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);
