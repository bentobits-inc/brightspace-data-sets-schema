-- Grade Scheme Ranges
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): GradeSchemeRangeId, GradeSchemeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeSchemeId -> GradeSchemes.GradeSchemeId
CREATE TABLE IF NOT EXISTS "GradeSchemeRanges" (
    "GradeSchemeRangeId" BIGINT,
    "GradeSchemeId" BIGINT,
    "SymbolString" VARCHAR(100),
    "AssignedValue" NUMBER(19,9),
    "RangeStart" NUMBER(19,9),
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);
