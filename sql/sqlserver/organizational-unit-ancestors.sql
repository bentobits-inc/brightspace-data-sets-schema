-- Organizational Unit Ancestors
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId, AncestorOrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[OrganizationalUnitAncestors]', N'U') IS NULL
CREATE TABLE [dbo].[OrganizationalUnitAncestors] (
    [OrgUnitId] int NULL,
    [AncestorOrgUnitId] int NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL
);
