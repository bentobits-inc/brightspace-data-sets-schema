-- Competency Structure
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ObjectId, ParentObjectId, BaseObjectID, EntryTime
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectId -> CompetencyObjects.ObjectId
DROP TABLE IF EXISTS [dbo].[CompetencyStructure];
CREATE TABLE [dbo].[CompetencyStructure] (
    [ObjectId] bigint NULL,
    [ParentObjectId] bigint NULL,
    [BaseObjectID] bigint NULL,
    [Depth] int NULL,
    [EntryTime] int NULL
);
