-- Outcome Details
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): OutcomeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
DROP TABLE IF EXISTS [dbo].[OutcomeDetails];
CREATE TABLE [dbo].[OutcomeDetails] (
    [OutcomeId] uniqueidentifier NULL,
    [OutcomeDefinitionSource] nvarchar(1000) NULL,
    [OutcomeDefinitionId] nvarchar(128) NULL,
    [ParentOutcomeId] uniqueidentifier NULL,
    [Description] nvarchar(1000) NULL,
    [Notation] nvarchar(1000) NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);
