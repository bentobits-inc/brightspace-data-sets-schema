-- SCORM Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SCORMObjects" (
    "ScormObjectId" uuid,
    "OrgUnitId" integer,
    "ContentObjectId" integer,
    "ContentServiceContentId" uuid,
    "ContentServiceRevisionId" uuid,
    "ContentServiceTopicId" uuid,
    "Title" varchar(1000),
    "Description" varchar(1000),
    "LearningStandard" varchar(100),
    "LastModified" timestamp,
    "LastModifiedBy" integer
);
