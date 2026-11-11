-- Competency Activity Results
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ActivityId, OrgUnitId, UserId, LearningObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> CompetencyActivities.ActivityId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CompetencyActivityResults" (
    "ActivityId" BIGINT,
    "OrgUnitId" INTEGER,
    "UserId" INTEGER,
    "LearningObjectId" BIGINT,
    "IsAchieved" BOOLEAN,
    "PercentAchieved" DECIMAL(19,9),
    "RubricScore" DECIMAL(19,9),
    "RubricLevelAchieved" VARCHAR,
    "RubricId" BIGINT,
    "RubricCriterionId" BIGINT,
    "AchievedDate" TIMESTAMP,
    "Version" BIGINT
);
