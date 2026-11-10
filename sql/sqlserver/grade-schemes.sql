-- Grade Schemes
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[GradeSchemes]', N'U') IS NULL
CREATE TABLE [dbo].[GradeSchemes] (
    [GradeSchemeId] bigint NULL,
    [OrgUnitId] int NULL,
    [SchemeName] nvarchar(128) NULL,
    [DeletedDate] datetime2 NULL,
    [Version] bigint NULL
);
