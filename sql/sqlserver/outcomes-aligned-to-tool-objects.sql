-- Outcomes Aligned to Tool Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomesAlignedToToolObjects];
CREATE TABLE [dbo].[OutcomesAlignedToToolObjects] (
    [ObjectType] int NULL,
    [ObjectId] nvarchar(255) NULL,
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AIUtilization] int NULL
);
