-- Grade Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "GradeObjects" (
    "GradeObjectId" INTEGER,
    "OrgUnitId" INTEGER,
    "ParentGradeObjectId" INTEGER,
    "Name" VARCHAR,
    "TypeName" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsAutoPointed" BOOLEAN,
    "IsFormula" BOOLEAN,
    "IsBonus" BOOLEAN,
    "MaxPoints" DECIMAL(19,9),
    "CanExceedMaxGrade" BOOLEAN,
    "ExcludeFromFinalGradeCalc" BOOLEAN,
    "GradeSchemeId" BIGINT,
    "Weight" DECIMAL(19,9),
    "NumLowestGradesToDrop" INTEGER,
    "NumHighestGradesToDrop" INTEGER,
    "WeightDistributionType" VARCHAR,
    "CreatedDate" TIMESTAMP,
    "ToolName" VARCHAR,
    "AssociatedToolItemId" BIGINT,
    "LastModified" TIMESTAMP,
    "ShortName" VARCHAR,
    "GradeObjectTypeId" INTEGER,
    "SortOrder" INTEGER,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "ResultId" INTEGER,
    "ToolId" INTEGER,
    "Version" INTEGER
);
