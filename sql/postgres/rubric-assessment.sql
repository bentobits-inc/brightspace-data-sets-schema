-- Rubric Assessment
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): UserId, AssessmentId, ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RubricId -> RubricObjects.RubricId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "RubricAssessment" (
    "RubricId" bigint,
    "OrgUnitId" integer,
    "UserId" integer,
    "Score" numeric(36,2),
    "AssessedByUserId" integer,
    "AssessmentDate" timestamp,
    "IsCompleted" boolean,
    "ActivityType" varchar(50),
    "ActivityObjectId" bigint,
    "DateCreated" timestamp,
    "AssessmentId" bigint,
    "LevelAchievedId" bigint,
    "ActivityId" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);
