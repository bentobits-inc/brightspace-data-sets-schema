-- Intelligent Agent Run Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
CREATE TABLE IF NOT EXISTS `IntelligentAgentRunLog` (
    `AgentId` BIGINT,
    `AgentRunId` BIGINT,
    `IsPracticeRun` BOOLEAN,
    `IsRunNow` BOOLEAN,
    `NumUsers` INT,
    `NumUsersWithErrors` INT,
    `NumUsersWithInfos` INT,
    `NumUsersWithWarnings` INT,
    `RunUserId` INT,
    `RunDate` TIMESTAMP_NTZ
);
