-- Grade Objects Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeObjectsLog" (
    "LogId" BIGINT,
    "Name" VARCHAR(50),
    "GradeObjectId" INT,
    "UserId" INT,
    "GradeSymbolString" VARCHAR(50),
    "PointsDenominator" NUMBER(19,9),
    "PointsNumerator" NUMBER(19,9),
    "WeightedDenominator" NUMBER(19,9),
    "WeightedNumerator" NUMBER(19,9),
    "Modified" TIMESTAMP_NTZ,
    "ModifiedBy" INT
);
