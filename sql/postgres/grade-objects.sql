-- Grade Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeObjects" (
    "GradeObjectId" integer,
    "OrgUnitId" integer,
    "ParentGradeObjectId" integer,
    "Name" varchar(128),
    "TypeName" varchar(50),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsAutoPointed" boolean,
    "IsFormula" boolean,
    "IsBonus" boolean,
    "MaxPoints" numeric(19,9),
    "CanExceedMaxGrade" boolean,
    "ExcludeFromFinalGradeCalc" boolean,
    "GradeSchemeId" bigint,
    "Weight" numeric(19,9),
    "NumLowestGradesToDrop" integer,
    "NumHighestGradesToDrop" integer,
    "WeightDistributionType" varchar(8),
    "CreatedDate" timestamp,
    "ToolName" varchar(50),
    "AssociatedToolItemId" bigint,
    "LastModified" timestamp,
    "ShortName" varchar(128),
    "GradeObjectTypeId" integer,
    "SortOrder" integer,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "ResultId" integer,
    "ToolId" integer,
    "Version" integer
);
