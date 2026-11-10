-- Release Condition Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PreRequisiteId, ResultId, OrgUnitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ReleaseConditionObjects];
CREATE TABLE [dbo].[ReleaseConditionObjects] (
    [PreRequisiteId] int NULL,
    [ResultId] int NULL,
    [OrgUnitId] int NULL,
    [Name] varchar(64) NULL,
    [IsNegativeCondition] bit NULL,
    [PreRequisiteToolId] int NULL,
    [Id1] int NULL,
    [Id2] int NULL,
    [ResultToolId] int NULL,
    [UsesPercentage] bit NULL,
    [OperatorTypeDesc] varchar(3) NULL,
    [Version] bigint NULL,
    [Guid1] uniqueidentifier NULL,
    [Guid2] uniqueidentifier NULL
);
