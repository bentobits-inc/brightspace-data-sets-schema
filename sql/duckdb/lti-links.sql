-- LTI Links
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "LTILinks" (
    "LtiLinkId" BIGINT,
    "OrgUnitId" INTEGER,
    "Title" VARCHAR,
    "LinkType" INTEGER,
    "LTIVersion" VARCHAR,
    "Url" VARCHAR,
    "Description" VARCHAR,
    "IsVisible" BOOLEAN,
    "SendTCInfo" BOOLEAN,
    "SendContextInfo" BOOLEAN,
    "SendCourseInfo" BOOLEAN,
    "SendOrgUnitInfo" BOOLEAN,
    "SendUserId" BOOLEAN,
    "SendUserName" BOOLEAN,
    "SendUserEmail" BOOLEAN,
    "SendLinkTitle" BOOLEAN,
    "SendLinkDescription" BOOLEAN,
    "SendD2LUserName" BOOLEAN,
    "SendD2LOrgDefinedId" BOOLEAN,
    "SendD2LOrgRoleId" BOOLEAN,
    "SendBrightspaceUserId" BOOLEAN,
    "Anonymous" BOOLEAN,
    "Shared" BOOLEAN,
    "UseToolProviderSecuritySettings" BOOLEAN,
    "LastModifiedDate" TIMESTAMP,
    "OuAvailabilitySetId" BIGINT,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "DeploymentId" UUID,
    "LinkSubType" INTEGER
);
