-- SCORM Activities
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
IF OBJECT_ID(N'[dbo].[SCORMActivities]', N'U') IS NULL
CREATE TABLE [dbo].[SCORMActivities] (
    [ActivityId] uniqueidentifier NULL,
    [ScormObjectId] uniqueidentifier NULL,
    [ParentActivityId] uniqueidentifier NULL,
    [NumChildren] int NULL,
    [InternalId] nvarchar(255) NULL,
    [Title] nvarchar(200) NULL,
    [CompletionThreshold] float(24) NULL,
    [PassingScore] float(24) NULL,
    [PassingScoreUsed] bit NULL,
    [ScoreMin] float(24) NULL,
    [ScoreMax] float(24) NULL,
    [LastModified] datetime2 NULL
);
