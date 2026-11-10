-- Outcomes Course Specific Scales
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesCourseSpecificScales];
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
