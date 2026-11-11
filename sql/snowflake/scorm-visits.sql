-- SCORM Visits
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SCORMVisits" (
    "VisitId" VARCHAR(36),
    "ScormObjectId" VARCHAR(36),
    "UserId" INT,
    "OrgUnitId" INT,
    "FirstAccessDate" TIMESTAMP_NTZ,
    "LastAccessDate" TIMESTAMP_NTZ,
    "CompletedDate" TIMESTAMP_NTZ,
    "Completion" VARCHAR(100),
    "Success" VARCHAR(100),
    "Score" FLOAT,
    "TimeSpent" INT,
    "Progress" FLOAT,
    "LastModified" TIMESTAMP_NTZ
);
