-- LTI Links
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LtiLinkId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[LTILinks]', N'U') IS NULL
CREATE TABLE [dbo].[LTILinks] (
    [LtiLinkId] bigint NULL,
    [OrgUnitId] int NULL,
    [Title] nvarchar(200) NULL,
    [LinkType] int NULL,
    [LTIVersion] varchar(12) NULL,
    [Url] nvarchar(2000) NULL,
    [Description] nvarchar(1000) NULL,
    [IsVisible] bit NULL,
    [SendTCInfo] bit NULL,
    [SendContextInfo] bit NULL,
    [SendCourseInfo] bit NULL,
    [SendOrgUnitInfo] bit NULL,
    [SendUserId] bit NULL,
    [SendUserName] bit NULL,
    [SendUserEmail] bit NULL,
    [SendLinkTitle] bit NULL,
    [SendLinkDescription] bit NULL,
    [SendD2LUserName] bit NULL,
    [SendD2LOrgDefinedId] bit NULL,
    [SendD2LOrgRoleId] bit NULL,
    [SendBrightspaceUserId] bit NULL,
    [Anonymous] bit NULL,
    [Shared] bit NULL,
    [UseToolProviderSecuritySettings] bit NULL,
    [LastModifiedDate] datetime2 NULL,
    [OuAvailabilitySetId] bigint NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [CreatedDate] datetime2 NULL,
    [DeploymentId] uniqueidentifier NULL,
    [LinkSubType] int NULL
);
