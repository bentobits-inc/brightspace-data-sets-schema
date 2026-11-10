-- Checklist Completions
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ChecklistCompletions];
CREATE TABLE [dbo].[ChecklistCompletions] (
    [UserId] int NULL,
    [DateCompleted] datetime2 NULL,
    [ItemId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsCompleted] bit NULL,
    [DateDeleted] datetime2 NULL,
    [DeletedBy] int NULL,
    [Version] bigint NULL
);
