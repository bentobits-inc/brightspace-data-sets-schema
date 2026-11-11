-- Competency Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyActivities" (
    "ActivityId" bigint,
    "OrgUnitId" integer,
    "ActivityName" varchar(256),
    "ActivityTypeId" integer,
    "AssessmentType" varchar(7),
    "ObjectLookupId" bigint,
    "RubricId" bigint,
    "LevelId" bigint,
    "RubricCriterionId" bigint,
    "AssessmentThresholdCriteria" varchar(2),
    "AssessmentThreshold" numeric(19,9),
    "IsAutoEval" boolean,
    "RubricName" varchar(256),
    "RubricLevelRequired" varchar(256),
    "ObjectId" bigint,
    "ActivityType" varchar(50),
    "Version" bigint
);
