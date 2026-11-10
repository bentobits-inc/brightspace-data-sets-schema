-- SCORM Visits
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[SCORMVisits];
CREATE TABLE [dbo].[SCORMVisits] (
    [VisitId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [UserId] int NULL,
    [OrgUnitId] int NULL,
    [FirstAccessDate] datetime2 NULL,
    [LastAccessDate] datetime2 NULL,
    [CompletedDate] datetime2 NULL,
    [Completion] nvarchar(100) NULL,
    [Success] nvarchar(100) NULL,
    [Score] float(24) NULL,
    [TimeSpent] int NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);
