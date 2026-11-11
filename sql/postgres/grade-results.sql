-- Grade Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "GradeResults" (
    "GradeObjectId" integer,
    "OrgUnitId" integer,
    "UserId" integer,
    "PointsNumerator" numeric(19,9),
    "PointsDenominator" numeric(19,9),
    "WeightedNumerator" numeric(19,9),
    "WeightedDenominator" numeric(19,9),
    "IsReleased" boolean,
    "IsDropped" boolean,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "Comments" varchar(1000),
    "PrivateComments" varchar(1000),
    "GradeText" varchar(50),
    "GradeReleasedDate" timestamp,
    "Version" bigint,
    "IsDeleted" boolean
);
