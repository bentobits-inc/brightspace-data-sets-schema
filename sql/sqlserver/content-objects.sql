-- Content Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
DROP TABLE IF EXISTS [dbo].[ContentObjects];
CREATE TABLE [dbo].[ContentObjects] (
    [ContentObjectId] int NULL,
    [OrgUnitId] int NULL,
    [Title] nvarchar(150) NULL,
    [ContentObjectType] varchar(6) NULL,
    [CompletionType] varchar(7) NULL,
    [ParentContentObjectId] int NULL,
    [Location] nvarchar(1024) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DueDate] datetime2 NULL,
    [ObjectId1] int NULL,
    [ObjectId2] int NULL,
    [ObjectId3] int NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [SortOrder] int NULL,
    [Depth] int NULL,
    [ToolId] int NULL,
    [IsHidden] bit NULL,
    [ResultId] int NULL,
    [DeletedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedBy] int NULL,
    [DeletedBy] int NULL,
    [AIUtilization] int NULL,
    [Version] bigint NULL
);
