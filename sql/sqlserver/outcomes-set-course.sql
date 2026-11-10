-- Outcomes Set Course
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
DROP TABLE IF EXISTS [dbo].[OutcomesSetCourse];
CREATE TABLE [dbo].[OutcomesSetCourse] (
    [RegistryId] uniqueidentifier NULL,
    [OrgUnitId] bigint NULL,
    [SourceOutcomeSetId] bigint NULL,
    [IsPrimary] bit NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [ScaleId] uniqueidentifier NULL,
    [AchievementThreshold] uniqueidentifier NULL
);
