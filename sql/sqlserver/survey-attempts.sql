-- Survey Attempts
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttemptId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): SurveyId -> SurveyObjects.SurveyId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SurveyAttempts];
CREATE TABLE [dbo].[SurveyAttempts] (
    [AttemptId] bigint NULL,
    [SurveyId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [AttemptNumber] int NULL,
    [TimeStarted] datetime2 NULL,
    [TimeCompleted] datetime2 NULL,
    [AttemptedFromOrgUnitId] int NULL,
    [OldAttemptNumber] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
