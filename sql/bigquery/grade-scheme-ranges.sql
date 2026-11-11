-- Grade Scheme Ranges
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS `GradeSchemeRanges` (
    `GradeSchemeRangeId` INT64,
    `GradeSchemeId` INT64,
    `SymbolString` STRING(100),
    `AssignedValue` NUMERIC(19,9),
    `RangeStart` NUMERIC(19,9),
    `IsDeleted` BOOL,
    `Version` INT64
);
