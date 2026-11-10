-- Auditor Relationships Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[AuditorRelationshipsLog];
CREATE TABLE [dbo].[AuditorRelationshipsLog] (
    [AuditorId] int NULL,
    [UserToAuditId] int NULL,
    [OrgUnitId] int NULL,
    [Action] nvarchar(16) NULL,
    [ModifiedBy] int NULL,
    [ModifiedDate] datetime2 NULL
);
