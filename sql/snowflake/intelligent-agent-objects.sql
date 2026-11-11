-- Intelligent Agent Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "IntelligentAgentObjects" (
    "AgentId" BIGINT,
    "OrgUnitId" INT,
    "AgentName" VARCHAR(128),
    "Description" VARCHAR(1000),
    "Enabled" BOOLEAN,
    "SpecificRoles" VARCHAR(1000),
    "LoginConditionEnabled" BOOLEAN,
    "LoginConditionThreshold" INT,
    "LoginConditionType" VARCHAR(14),
    "AccessConditionEnabled" BOOLEAN,
    "AccessConditionThreshold" INT,
    "AccessConditionType" VARCHAR(20),
    "ResultId" BIGINT,
    "RepeatType" VARCHAR(10),
    "EmailWhenSatisfied" BOOLEAN,
    "EnableSchedule" BOOLEAN,
    "ScheduleType" VARCHAR(10),
    "ScheduleRepeatsEvery" INT,
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);
