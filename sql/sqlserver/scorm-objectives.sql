-- SCORM Objectives
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
IF OBJECT_ID(N'[dbo].[SCORMObjectives]', N'U') IS NULL
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
