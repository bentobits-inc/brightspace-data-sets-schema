-- Creator+ Practices Adoption
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityInstanceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedById -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[CreatorPracticesAdoption];
CREATE TABLE [dbo].[CreatorPracticesAdoption] (
    [ActivityInstanceId] int NULL,
    [CreatedById] int NULL,
    [OrgUnitId] int NULL,
    [PracticeType] nvarchar(32) NULL,
    [PracticeTitle] nvarchar(255) NULL,
    [ProviderObjectId] int NULL,
    [CreatedDate] datetime2 NULL,
    [Version] bigint NULL
);
