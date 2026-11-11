-- Outcomes Scale Level Definition
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesScaleLevelDefinition" (
    "ScaleLevelId" UUID,
    "ScaleId" UUID,
    "Name" VARCHAR,
    "SortOrder" INTEGER,
    "PercentageRangeStart" INTEGER,
    "RGB" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER
);
