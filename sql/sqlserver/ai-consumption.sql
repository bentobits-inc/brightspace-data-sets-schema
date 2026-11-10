-- AI Consumption
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ConsumptionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AIConsumption];
CREATE TABLE [dbo].[AIConsumption] (
    [ConsumptionId] nvarchar(255) NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [Date] datetime2 NULL,
    [GenerationCount] int NULL,
    [ConsumptionSource] int NULL
);
