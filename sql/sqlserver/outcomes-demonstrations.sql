-- Outcomes Demonstrations
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[OutcomesDemonstrations]', N'U') IS NULL
CREATE TABLE [dbo].[OutcomesDemonstrations] (
    [DemonstrationId] uniqueidentifier NULL,
    [ExplicitlyEnteredScaleLevelId] uniqueidentifier NULL,
    [AutomaticallyGeneratedScaleLevelId] uniqueidentifier NULL,
    [AlignedObjectType] int NULL,
    [AlignedObjectId] nvarchar(1000) NULL,
    [OutcomeId] uniqueidentifier NULL,
    [RegistryId] uniqueidentifier NULL,
    [IsPublished] bit NULL,
    [AssessedUserId] int NULL,
    [AssessedDate] datetime2 NULL,
    [AssessorUserId] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL
);
