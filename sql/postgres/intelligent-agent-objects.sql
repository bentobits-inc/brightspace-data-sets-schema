-- Intelligent Agent Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "IntelligentAgentObjects" (
    "AgentId" bigint,
    "OrgUnitId" integer,
    "AgentName" varchar(128),
    "Description" varchar(1000),
    "Enabled" boolean,
    "SpecificRoles" varchar(1000),
    "LoginConditionEnabled" boolean,
    "LoginConditionThreshold" integer,
    "LoginConditionType" varchar(14),
    "AccessConditionEnabled" boolean,
    "AccessConditionThreshold" integer,
    "AccessConditionType" varchar(20),
    "ResultId" bigint,
    "RepeatType" varchar(10),
    "EmailWhenSatisfied" boolean,
    "EnableSchedule" boolean,
    "ScheduleType" varchar(10),
    "ScheduleRepeatsEvery" integer,
    "StartDate" timestamp,
    "EndDate" timestamp,
    "LastModified" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);
