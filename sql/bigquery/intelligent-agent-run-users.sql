-- Intelligent Agent Run Users
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AgentId, AgentRunId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
-- Join (informational): AgentRunId -> IntelligentAgentRunLog.AgentRunId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunUsers` (
    `AgentId` INT64,
    `AgentRunId` INT64,
    `UserId` INT64,
    `OrgUnitId` INT64,
    `ActionTypeName` STRING(50),
    `ActionHasError` BOOL,
    `ActionHasInfo` BOOL,
    `ActionHasWarning` BOOL,
    `ShouldRetry` BOOL
);
