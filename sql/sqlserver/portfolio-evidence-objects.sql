-- Portfolio Evidence Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): EvidenceId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[PortfolioEvidenceObjects];
CREATE TABLE [dbo].[PortfolioEvidenceObjects] (
    [EvidenceId] uniqueidentifier NULL,
    [OwnerId] int NULL,
    [OrgUnitId] int NULL,
    [EvidenceType] nvarchar(30) NULL,
    [Title] nvarchar(1000) NULL,
    [IsApproved] bit NULL,
    [IsSpotlighted] bit NULL,
    [IsSharedToParents] bit NULL,
    [IsDeleted] bit NULL,
    [IsRecoverableByInstructor] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsSharedWithInstructor] bit NULL,
    [DateSharedWithInstructor] datetime2 NULL
);
