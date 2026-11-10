-- CPD Job Targets
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
IF OBJECT_ID(N'[dbo].[CPDJobTargets]', N'U') IS NULL
CREATE TABLE [dbo].[CPDJobTargets] (
    [PrincipalId] int NULL,
    [CategoryId] int NULL,
    [JobTitle] nvarchar(256) NULL,
    [StructuredMinutes] int NULL,
    [UnstructuredMinutes] int NULL,
    [StructuredRecordCount] int NULL,
    [UnstructuredRecordCount] int NULL,
    [StartDate] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);
