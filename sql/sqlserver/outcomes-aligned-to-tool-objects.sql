-- Outcomes Aligned to Tool Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectType, ObjectId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[OutcomesAlignedToToolObjects]', N'U') IS NULL
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
