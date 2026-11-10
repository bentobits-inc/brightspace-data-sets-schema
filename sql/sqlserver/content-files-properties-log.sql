-- Content Files Properties Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OrgUnitId, ContentObjectId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[ContentFilesPropertiesLog];
CREATE TABLE [dbo].[ContentFilesPropertiesLog] (
    [OrgUnitId] int NULL,
    [ContentObjectId] int NULL,
    [Action] nvarchar(10) NULL,
    [FilePath] nvarchar(max) NULL,
    [FileName] nvarchar(512) NULL,
    [FileExtension] nvarchar(512) NULL,
    [FileSizeBytes] bigint NULL,
    [UploadDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [LastModified] datetime2 NULL
);
