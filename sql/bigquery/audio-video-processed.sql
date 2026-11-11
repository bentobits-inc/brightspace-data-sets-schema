-- Audio Video Processed
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): ContentId, RevisionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentId -> MediaObjects.ContentId
CREATE TABLE IF NOT EXISTS `AudioVideoProcessed` (
    `ContentId` STRING(36),
    `RevisionId` STRING(36),
    `RevisionNumber` INT64,
    `Type` STRING(5),
    `Source` STRING(32),
    `RevisionSize` INT64,
    `Duration` INT64,
    `RequiredTranscoding` BOOL,
    `RequiredTranscribing` BOOL,
    `LastModified` DATETIME
);
