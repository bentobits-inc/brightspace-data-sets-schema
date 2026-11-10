-- Activity Exemptions Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityExemptionsLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[ActivityExemptionsLog]', N'U') IS NULL
CREATE TABLE [dbo].[ActivityExemptionsLog] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [ObjectId] int NULL,
    [ActivityId] varchar(225) NULL,
    [LogTypeName] varchar(50) NULL,
    [LastModifiedUtc] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [ActivityExemptionsLogId] bigint NULL,
    [ToolId] int NULL
);
