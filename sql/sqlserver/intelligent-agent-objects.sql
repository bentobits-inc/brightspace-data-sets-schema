-- Intelligent Agent Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[IntelligentAgentObjects];
CREATE TABLE [dbo].[IntelligentAgentObjects] (
    [AgentId] bigint NULL,
    [OrgUnitId] int NULL,
    [AgentName] nvarchar(128) NULL,
    [Description] nvarchar(1000) NULL,
    [Enabled] bit NULL,
    [SpecificRoles] nvarchar(1000) NULL,
    [LoginConditionEnabled] bit NULL,
    [LoginConditionThreshold] int NULL,
    [LoginConditionType] nvarchar(14) NULL,
    [AccessConditionEnabled] bit NULL,
    [AccessConditionThreshold] int NULL,
    [AccessConditionType] nvarchar(20) NULL,
    [ResultId] bigint NULL,
    [RepeatType] nvarchar(10) NULL,
    [EmailWhenSatisfied] bit NULL,
    [EnableSchedule] bit NULL,
    [ScheduleType] nvarchar(10) NULL,
    [ScheduleRepeatsEvery] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);
