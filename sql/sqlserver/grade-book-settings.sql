-- Grade Book Settings
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[GradeBookSettings];
CREATE TABLE [dbo].[GradeBookSettings] (
    [OrgUnitId] int NULL,
    [GradeSchemeId] bigint NULL,
    [GradingSystem] varchar(8) NULL,
    [UngradedItems] varchar(25) NULL,
    [IsAdjustedFinalGradeReleased] bit NULL,
    [IsCalculatedFinalGradeReleased] bit NULL,
    [LastModified] datetime2 NULL
);
