-- Outcomes Course Specific Scales
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
IF OBJECT_ID(N'[dbo].[OutcomesCourseSpecificScales]', N'U') IS NULL
CREATE TABLE [dbo].[OutcomesCourseSpecificScales] (
    [OrgUnitId] int NULL,
    [RegistryId] uniqueidentifier NULL,
    [ScaleId] uniqueidentifier NULL,
    [AchievementThreshold] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);
