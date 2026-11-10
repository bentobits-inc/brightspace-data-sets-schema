-- Attendance Schemes
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SchemeId, SchemeSymbolId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AttendanceSchemes];
CREATE TABLE [dbo].[AttendanceSchemes] (
    [SchemeId] bigint NULL,
    [OrgUnitId] int NULL,
    [SchemeName] nvarchar(128) NULL,
    [SchemeSymbolId] bigint NULL,
    [SymbolName] nvarchar(128) NULL,
    [SymbolValue] nvarchar(50) NULL,
    [Percentage] decimal(19,9) NULL,
    [Version] bigint NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL
);
