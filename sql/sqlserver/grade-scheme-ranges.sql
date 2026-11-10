-- Grade Scheme Ranges
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
DROP TABLE IF EXISTS [dbo].[GradeSchemeRanges];
CREATE TABLE [dbo].[GradeSchemeRanges] (
    [GradeSchemeRangeId] bigint NULL,
    [GradeSchemeId] bigint NULL,
    [SymbolString] nvarchar(100) NULL,
    [AssignedValue] decimal(19,9) NULL,
    [RangeStart] decimal(19,9) NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
