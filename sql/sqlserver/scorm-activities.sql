-- SCORM Activities
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ActivityId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ScormObjectId -> SCORMObjects.ScormObjectId
DROP TABLE IF EXISTS [dbo].[SCORMActivities];
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
