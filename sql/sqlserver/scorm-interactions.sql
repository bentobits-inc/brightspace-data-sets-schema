-- SCORM Interactions
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
DROP TABLE IF EXISTS [dbo].[SCORMInteractions];
CREATE TABLE [dbo].[SCORMInteractions] (
    [InteractionId] uniqueidentifier NULL,
    [ActivityId] uniqueidentifier NULL,
    [InternalId] nvarchar(255) NULL,
    [InteractionType] nvarchar(100) NULL,
    [Description] nvarchar(250) NULL,
    [Weighting] float(24) NULL,
    [CorrectResponses] nvarchar(2000) NULL,
    [LastModified] datetime2 NULL
);
