-- SCORM Interactions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): InteractionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
CREATE TABLE IF NOT EXISTS `SCORMInteractions` (
    `InteractionId` STRING(36),
    `ActivityId` STRING(36),
    `InternalId` STRING(255),
    `InteractionType` STRING(100),
    `Description` STRING(250),
    `Weighting` FLOAT64,
    `CorrectResponses` STRING(2000),
    `LastModified` DATETIME
);
