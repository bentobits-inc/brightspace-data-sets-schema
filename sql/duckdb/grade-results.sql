-- Grade Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "PointsNumerator" DECIMAL(19,9),
    "PointsDenominator" DECIMAL(19,9),
    "WeightedNumerator" DECIMAL(19,9),
    "WeightedDenominator" DECIMAL(19,9),
    "IsReleased" BOOLEAN,
    "IsDropped" BOOLEAN,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "Comments" VARCHAR,
    "PrivateComments" VARCHAR,
    "GradeText" VARCHAR,
    "GradeReleasedDate" TIMESTAMP,
    "Version" BIGINT,
    "IsDeleted" BOOLEAN
);
