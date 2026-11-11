-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" VARCHAR(36),
    "UserId" INT,
    "IMSRoleNames" VARCHAR(10000),
    "ImpersonatingUserId" BIGINT,
    "ImpersonatingUserIMSRoleNames" VARCHAR(10000),
    "LaunchDate" TIMESTAMP_NTZ,
    "OrgUnitId" BIGINT,
    "LTILinkId" BIGINT,
    "DeploymentId" VARCHAR(36),
    "ClientId" VARCHAR(36),
    "ToolProviderId" VARCHAR(300),
    "ContentTopicId" BIGINT,
    "ParentModuleId" BIGINT,
    "Placement" VARCHAR(10),
    "MessageVersion" VARCHAR(10),
    "RequestType" VARCHAR(30)
);
