-- SCORM Visits
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): VisitId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[SCORMVisits]', N'U') IS NULL
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
