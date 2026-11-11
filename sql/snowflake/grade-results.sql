-- Grade Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" INT,
    "OrgUnitId" INT,
    "UserId" INT,
    "PointsNumerator" NUMBER(19,9),
    "PointsDenominator" NUMBER(19,9),
    "WeightedNumerator" NUMBER(19,9),
    "WeightedDenominator" NUMBER(19,9),
    "IsReleased" BOOLEAN,
    "IsDropped" BOOLEAN,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "Comments" VARCHAR(1000),
    "PrivateComments" VARCHAR(1000),
    "GradeText" VARCHAR(50),
    "GradeReleasedDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "IsDeleted" BOOLEAN
);
