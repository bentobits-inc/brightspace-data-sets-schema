-- Intelligent Agent Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): AgentId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `IntelligentAgentObjects` (
    `AgentId` INT64,
    `OrgUnitId` INT64,
    `AgentName` STRING(128),
    `Description` STRING(1000),
    `Enabled` BOOL,
    `SpecificRoles` STRING(1000),
    `LoginConditionEnabled` BOOL,
    `LoginConditionThreshold` INT64,
    `LoginConditionType` STRING(14),
    `AccessConditionEnabled` BOOL,
    `AccessConditionThreshold` INT64,
    `AccessConditionType` STRING(20),
    `ResultId` INT64,
    `RepeatType` STRING(10),
    `EmailWhenSatisfied` BOOL,
    `EnableSchedule` BOOL,
    `ScheduleType` STRING(10),
    `ScheduleRepeatsEvery` INT64,
    `StartDate` DATETIME,
    `EndDate` DATETIME,
    `LastModified` DATETIME,
    `LastModifiedBy` INT64,
    `IsDeleted` BOOL
);
