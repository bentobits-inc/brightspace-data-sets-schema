-- Content User Completion
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[ContentUserCompletion]', N'U') IS NULL
CREATE TABLE [dbo].[ContentUserCompletion] (
    [ContentObjectId] int NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [DateCompleted] datetime2 NULL,
    [LastModified] datetime2 NULL,
    [Version] bigint NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AutomaticDateCompleted] datetime2 NULL,
    [ManualDateCompleted] datetime2 NULL
);
