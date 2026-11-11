-- Survey Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "SurveyAttempts" (
    "AttemptId" bigint,
    "SurveyId" bigint,
    "UserId" integer,
    "OrgUnitId" integer,
    "AttemptNumber" integer,
    "TimeStarted" timestamp,
    "TimeCompleted" timestamp,
    "AttemptedFromOrgUnitId" integer,
    "OldAttemptNumber" integer,
    "IsDeleted" boolean,
    "Version" bigint
);
