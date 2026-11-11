-- Content Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS "ContentObjects" (
    "ContentObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "Title" VARCHAR,
    "ContentObjectType" VARCHAR,
    "CompletionType" VARCHAR,
    "ParentContentObjectId" INTEGER,
    "Location" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "ObjectId1" INTEGER,
    "ObjectId2" INTEGER,
    "ObjectId3" INTEGER,
    "LastModified" TIMESTAMP,
    "IsDeleted" BOOLEAN,
    "SortOrder" INTEGER,
    "Depth" INTEGER,
    "ToolId" INTEGER,
    "IsHidden" BOOLEAN,
    "ResultId" INTEGER,
    "DeletedDate" TIMESTAMP,
    "CreatedBy" INTEGER,
    "LastModifiedBy" INTEGER,
    "DeletedBy" INTEGER,
    "AIUtilization" INTEGER,
    "Version" BIGINT
);
