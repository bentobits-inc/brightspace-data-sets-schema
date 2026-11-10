-- SCORM Interaction Objectives
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
DROP TABLE IF EXISTS [dbo].[SCORMInteractionObjectives];
CREATE TABLE [dbo].[SCORMInteractionObjectives] (
    [InteractionId] uniqueidentifier NULL,
    [ObjectiveId] uniqueidentifier NULL,
    [LastModified] datetime2 NULL
);
