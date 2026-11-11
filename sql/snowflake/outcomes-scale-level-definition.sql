-- Outcomes Scale Level Definition
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
CREATE TABLE IF NOT EXISTS "OutcomesScaleLevelDefinition" (
    "ScaleLevelId" VARCHAR(36),
    "ScaleId" VARCHAR(36),
    "Name" VARCHAR(1000),
    "SortOrder" INT,
    "PercentageRangeStart" INT,
    "RGB" VARCHAR(40),
    "CreatedDate" TIMESTAMP_NTZ,
    "CreatedBy" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);
