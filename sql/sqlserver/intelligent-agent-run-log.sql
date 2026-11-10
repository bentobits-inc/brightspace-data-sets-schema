-- Intelligent Agent Run Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AgentRunId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AgentId -> IntelligentAgentObjects.AgentId
IF OBJECT_ID(N'[dbo].[IntelligentAgentRunLog]', N'U') IS NULL
CREATE TABLE [dbo].[IntelligentAgentRunLog] (
    [AgentId] bigint NULL,
    [AgentRunId] bigint NULL,
    [IsPracticeRun] bit NULL,
    [IsRunNow] bit NULL,
    [NumUsers] int NULL,
    [NumUsersWithErrors] int NULL,
    [NumUsersWithInfos] int NULL,
    [NumUsersWithWarnings] int NULL,
    [RunUserId] int NULL,
    [RunDate] datetime2 NULL
);
