-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS `LTILaunches` (
    `LTILaunchId` STRING(36),
    `UserId` INT64,
    `IMSRoleNames` STRING(10000),
    `ImpersonatingUserId` INT64,
    `ImpersonatingUserIMSRoleNames` STRING(10000),
    `LaunchDate` DATETIME,
    `OrgUnitId` INT64,
    `LTILinkId` INT64,
    `DeploymentId` STRING(36),
    `ClientId` STRING(36),
    `ToolProviderId` STRING(300),
    `ContentTopicId` INT64,
    `ParentModuleId` INT64,
    `Placement` STRING(10),
    `MessageVersion` STRING(10),
    `RequestType` STRING(30)
);
