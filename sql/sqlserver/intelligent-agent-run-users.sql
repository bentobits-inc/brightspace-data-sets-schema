-- Intelligent Agent Run Users
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[IntelligentAgentRunUsers];
CREATE TABLE [dbo].[IntelligentAgentRunUsers] (
    [AgentId] bigint NULL,
    [AgentRunId] bigint NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [ActionTypeName] nvarchar(50) NULL,
    [ActionHasError] bit NULL,
    [ActionHasInfo] bit NULL,
    [ActionHasWarning] bit NULL,
    [ShouldRetry] bit NULL
);
