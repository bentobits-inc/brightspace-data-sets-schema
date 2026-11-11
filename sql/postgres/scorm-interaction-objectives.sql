-- SCORM Interaction Objectives
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): InteractionId, ObjectiveId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
CREATE TABLE IF NOT EXISTS "SCORMInteractionObjectives" (
    "InteractionId" uuid,
    "ObjectiveId" uuid,
    "LastModified" timestamp
);
