-- Content Files Properties Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" INT,
    "ContentObjectId" INT,
    "Action" VARCHAR(10),
    "FilePath" VARCHAR(10000),
    "FileName" VARCHAR(512),
    "FileExtension" VARCHAR(512),
    "FileSizeBytes" BIGINT,
    "UploadDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "LastModified" TIMESTAMP_NTZ
);
