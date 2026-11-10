-- Course Access Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId, UserId, Timestamp, Source
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CourseAccessLog];
CREATE TABLE [dbo].[CourseAccessLog] (
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [Timestamp] datetime2 NULL,
    [Source] nvarchar(20) NULL
);
