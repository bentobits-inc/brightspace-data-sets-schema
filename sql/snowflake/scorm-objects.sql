-- SCORM Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "SCORMObjects" (
    "ScormObjectId" VARCHAR(36),
    "OrgUnitId" INT,
    "ContentObjectId" INT,
    "ContentServiceContentId" VARCHAR(36),
    "ContentServiceRevisionId" VARCHAR(36),
    "ContentServiceTopicId" VARCHAR(36),
    "Title" VARCHAR(1000),
    "Description" VARCHAR(1000),
    "LearningStandard" VARCHAR(100),
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT
);
