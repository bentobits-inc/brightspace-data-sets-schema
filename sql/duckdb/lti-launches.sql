-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" UUID,
    "UserId" INTEGER,
    "IMSRoleNames" VARCHAR,
    "ImpersonatingUserId" BIGINT,
    "ImpersonatingUserIMSRoleNames" VARCHAR,
    "LaunchDate" TIMESTAMP,
    "OrgUnitId" BIGINT,
    "LTILinkId" BIGINT,
    "DeploymentId" UUID,
    "ClientId" UUID,
    "ToolProviderId" VARCHAR,
    "ContentTopicId" BIGINT,
    "ParentModuleId" BIGINT,
    "Placement" VARCHAR,
    "MessageVersion" VARCHAR,
    "RequestType" VARCHAR
);
