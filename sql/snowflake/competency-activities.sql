-- Competency Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyActivities" (
    "ActivityId" BIGINT,
    "OrgUnitId" INT,
    "ActivityName" VARCHAR(256),
    "ActivityTypeId" INT,
    "AssessmentType" VARCHAR(7),
    "ObjectLookupId" BIGINT,
    "RubricId" BIGINT,
    "LevelId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AssessmentThresholdCriteria" VARCHAR(2),
    "AssessmentThreshold" NUMBER(19,9),
    "IsAutoEval" BOOLEAN,
    "RubricName" VARCHAR(256),
    "RubricLevelRequired" VARCHAR(256),
    "ObjectId" BIGINT,
    "ActivityType" VARCHAR(50),
    "Version" BIGINT
);
