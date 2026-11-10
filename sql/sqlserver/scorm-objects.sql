-- SCORM Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ScormObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[SCORMObjects];
CREATE TABLE [dbo].[SCORMObjects] (
    [ScormObjectId] uniqueidentifier NULL,
    [OrgUnitId] int NULL,
    [ContentObjectId] int NULL,
    [ContentServiceContentId] uniqueidentifier NULL,
    [ContentServiceRevisionId] uniqueidentifier NULL,
    [ContentServiceTopicId] uniqueidentifier NULL,
    [Title] nvarchar(1000) NULL,
    [Description] nvarchar(1000) NULL,
    [LearningStandard] nvarchar(100) NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);
