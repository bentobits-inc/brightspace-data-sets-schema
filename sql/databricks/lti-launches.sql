-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS `LTILaunches` (
    `LTILaunchId` STRING,
    `UserId` INT,
    `IMSRoleNames` STRING,
    `ImpersonatingUserId` BIGINT,
    `ImpersonatingUserIMSRoleNames` STRING,
    `LaunchDate` TIMESTAMP_NTZ,
    `OrgUnitId` BIGINT,
    `LTILinkId` BIGINT,
    `DeploymentId` STRING,
    `ClientId` STRING,
    `ToolProviderId` STRING,
    `ContentTopicId` BIGINT,
    `ParentModuleId` BIGINT,
    `Placement` STRING,
    `MessageVersion` STRING,
    `RequestType` STRING
);
