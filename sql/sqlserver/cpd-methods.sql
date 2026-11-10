-- CPD Methods
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): MethodId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[CPDMethods]', N'U') IS NULL
CREATE TABLE [dbo].[CPDMethods] (
    [MethodId] int NULL,
    [Name] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [Version] bigint NULL
);
