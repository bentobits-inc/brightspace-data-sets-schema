-- Discussion Forums
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[DiscussionForums];
CREATE TABLE [dbo].[DiscussionForums] (
    [OrgUnitId] int NULL,
    [ForumId] bigint NULL,
    [Name] nvarchar(400) NULL,
    [Description] nvarchar(1000) NULL,
    [MustPostToParticipate] bit NULL,
    [AllowAnon] bit NULL,
    [IsHidden] bit NULL,
    [RequiresApproval] bit NULL,
    [SortOrder] int NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [ResultId] int NULL,
    [StartDate] datetime2 NULL,
    [StartDateAvailabilityType] smallint NULL,
    [EndDate] datetime2 NULL,
    [EndDateAvailabilityType] smallint NULL,
    [Version] bigint NULL
);
