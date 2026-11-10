-- Assignment Special Access
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): DropboxId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DropboxId -> AssignmentSummary.DropboxId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[AssignmentSpecialAccess];
CREATE TABLE [dbo].[AssignmentSpecialAccess] (
    [DropboxId] bigint NULL,
    [UserId] int NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [ModifiedBy] int NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDateAvailabilityType] smallint NULL
);
