-- Competency Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CompetencyObjects" (
    "ObjectId" bigint,
    "OrgUnitId" integer,
    "Name" varchar(256),
    "Type" varchar(256),
    "ReadyForEvaluation" boolean,
    "Status" varchar(9),
    "Description" varchar(1000),
    "NeedReevaluation" boolean,
    "ReevaluationIfAchieved" boolean,
    "ReevaluationIfNotAchieved" boolean,
    "AdditionalIdentifier" varchar(512),
    "IsHidden" boolean
);
