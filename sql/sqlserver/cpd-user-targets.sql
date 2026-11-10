-- CPD User Targets
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PrincipalId, CategoryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> CPDCategories.CategoryId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[CPDUserTargets];
CREATE TABLE [dbo].[CPDUserTargets] (
    [PrincipalId] int NULL,
    [CategoryId] int NULL,
    [UserId] int NULL,
    [StructuredMinutes] int NULL,
    [UnstructuredMinutes] int NULL,
    [StructuredRecordCount] int NULL,
    [UnstructuredRecordCount] int NULL,
    [StartDate] datetime2 NULL,
    [DateDeleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL
);
