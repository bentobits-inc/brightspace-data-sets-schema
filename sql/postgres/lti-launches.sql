-- LTI Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LTILaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LTILinkId -> LTILinks.LtiLinkId
CREATE TABLE IF NOT EXISTS "LTILaunches" (
    "LTILaunchId" uuid,
    "UserId" integer,
    "IMSRoleNames" varchar(10000),
    "ImpersonatingUserId" bigint,
    "ImpersonatingUserIMSRoleNames" varchar(10000),
    "LaunchDate" timestamp,
    "OrgUnitId" bigint,
    "LTILinkId" bigint,
    "DeploymentId" uuid,
    "ClientId" uuid,
    "ToolProviderId" varchar(300),
    "ContentTopicId" bigint,
    "ParentModuleId" bigint,
    "Placement" varchar(10),
    "MessageVersion" varchar(10),
    "RequestType" varchar(30)
);
