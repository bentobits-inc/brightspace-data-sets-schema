-- AI Consumption
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[AIConsumption]', N'U') IS NULL
CREATE TABLE [dbo].[AIConsumption] (
    [ConsumptionId] nvarchar(255) NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [Date] datetime2 NULL,
    [GenerationCount] int NULL,
    [ConsumptionSource] int NULL
);
