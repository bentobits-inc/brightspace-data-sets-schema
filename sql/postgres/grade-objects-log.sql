-- Grade Objects Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeObjectsLog" (
    "LogId" bigint,
    "Name" varchar(50),
    "GradeObjectId" integer,
    "UserId" integer,
    "GradeSymbolString" varchar(50),
    "PointsDenominator" numeric(19,9),
    "PointsNumerator" numeric(19,9),
    "WeightedDenominator" numeric(19,9),
    "WeightedNumerator" numeric(19,9),
    "Modified" timestamp,
    "ModifiedBy" integer
);
