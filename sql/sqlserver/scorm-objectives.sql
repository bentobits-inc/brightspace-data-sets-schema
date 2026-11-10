-- SCORM Objectives
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
DROP TABLE IF EXISTS [dbo].[SCORMObjectives];
CREATE TABLE [dbo].[SCORMObjectives] (
    [ObjectiveId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [ObjectiveType] nvarchar(100) NULL,
    [ActivityId] uniqueidentifier NULL,
    [InternalId] nvarchar(255) NULL,
    [IsPrimary] bit NULL,
    [Description] nvarchar(250) NULL,
    [ScoreMin] float(24) NULL,
    [ScoreMax] float(24) NULL,
    [LastModified] datetime2 NULL
);
