-- CPD User Records
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): RecordId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDUserRecords];
CREATE TABLE [dbo].[CPDUserRecords] (
    [RecordId] int NULL,
    [RecordName] nvarchar(256) NULL,
    [State] nvarchar(50) NULL,
    [UserId] int NULL,
    [Category] int NULL,
    [Method] int NULL,
    [CreditMinutes] int NULL,
    [Evidence] nvarchar(4000) NULL,
    [Type] nvarchar(50) NULL,
    [Grade] decimal(4,3) NULL,
    [DateCompleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);
