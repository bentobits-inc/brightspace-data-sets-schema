-- Content Files Properties Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" INTEGER,
    "ContentObjectId" INTEGER,
    "Action" VARCHAR,
    "FilePath" VARCHAR,
    "FileName" VARCHAR,
    "FileExtension" VARCHAR,
    "FileSizeBytes" BIGINT,
    "UploadDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "LastModified" TIMESTAMP
);
