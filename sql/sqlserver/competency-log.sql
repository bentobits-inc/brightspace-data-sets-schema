-- Competency Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CompetencyLogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
DROP TABLE IF EXISTS [dbo].[CompetencyLog];
CREATE TABLE [dbo].[CompetencyLog] (
    [CompetencyLogId] bigint NULL,
    [LogTypeId] int NULL,
    [LogTypeName] varchar(19) NULL,
    [ObjectId] bigint NULL,
    [ObjectTypeId] int NULL,
    [ObjectTypeName] varchar(18) NULL,
    [ObjectVersion] int NULL,
    [LogDateTime] datetime2 NULL,
    [ModifiedBy] bigint NULL,
    [IndirectObjectId] bigint NULL,
    [IndirectObjectTypeName] varchar(18) NULL,
    [IndirectObjectTypeId] int NULL,
    [IndirectObjectVersion] int NULL
);
