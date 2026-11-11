-- LTI Links
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "LTILinks" (
    "LtiLinkId" bigint,
    "OrgUnitId" integer,
    "Title" varchar(200),
    "LinkType" integer,
    "LTIVersion" varchar(12),
    "Url" varchar(2000),
    "Description" varchar(1000),
    "IsVisible" boolean,
    "SendTCInfo" boolean,
    "SendContextInfo" boolean,
    "SendCourseInfo" boolean,
    "SendOrgUnitInfo" boolean,
    "SendUserId" boolean,
    "SendUserName" boolean,
    "SendUserEmail" boolean,
    "SendLinkTitle" boolean,
    "SendLinkDescription" boolean,
    "SendD2LUserName" boolean,
    "SendD2LOrgDefinedId" boolean,
    "SendD2LOrgRoleId" boolean,
    "SendBrightspaceUserId" boolean,
    "Anonymous" boolean,
    "Shared" boolean,
    "UseToolProviderSecuritySettings" boolean,
    "LastModifiedDate" timestamp,
    "OuAvailabilitySetId" bigint,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "CreatedDate" timestamp,
    "DeploymentId" uuid,
    "LinkSubType" integer
);
