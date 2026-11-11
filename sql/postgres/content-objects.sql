-- Content Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ContentObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): ToolId -> Tools.ToolId
CREATE TABLE IF NOT EXISTS "ContentObjects" (
    "ContentObjectId" integer,
    "OrgUnitId" integer,
    "Title" varchar(150),
    "ContentObjectType" varchar(6),
    "CompletionType" varchar(7),
    "ParentContentObjectId" integer,
    "Location" varchar(1024),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "DueDate" timestamp,
    "ObjectId1" integer,
    "ObjectId2" integer,
    "ObjectId3" integer,
    "LastModified" timestamp,
    "IsDeleted" boolean,
    "SortOrder" integer,
    "Depth" integer,
    "ToolId" integer,
    "IsHidden" boolean,
    "ResultId" integer,
    "DeletedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedBy" integer,
    "DeletedBy" integer,
    "AIUtilization" integer,
    "Version" bigint
);
