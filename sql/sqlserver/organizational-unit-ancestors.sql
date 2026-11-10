-- Organizational Unit Ancestors
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[OrganizationalUnitAncestors];
CREATE TABLE [dbo].[OrganizationalUnitAncestors] (
    [OrgUnitId] int NULL,
    [AncestorOrgUnitId] int NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL
);
