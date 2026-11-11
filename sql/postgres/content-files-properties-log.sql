-- Content Files Properties Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ContentFilesPropertiesLog" (
    "OrgUnitId" integer,
    "ContentObjectId" integer,
    "Action" varchar(10),
    "FilePath" varchar(10000),
    "FileName" varchar(512),
    "FileExtension" varchar(512),
    "FileSizeBytes" bigint,
    "UploadDate" timestamp,
    "LastModifiedBy" integer,
    "LastModified" timestamp
);
