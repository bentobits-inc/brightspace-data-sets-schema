-- Grade Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): GradeObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
IF OBJECT_ID(N'[dbo].[GradeObjects]', N'U') IS NULL
CREATE TABLE [dbo].[GradeObjects] (
    [GradeObjectId] int NULL,
    [OrgUnitId] int NULL,
    [ParentGradeObjectId] int NULL,
    [Name] nvarchar(128) NULL,
    [TypeName] varchar(50) NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsAutoPointed] bit NULL,
    [IsFormula] bit NULL,
    [IsBonus] bit NULL,
    [MaxPoints] decimal(19,9) NULL,
    [CanExceedMaxGrade] bit NULL,
    [ExcludeFromFinalGradeCalc] bit NULL,
    [GradeSchemeId] bigint NULL,
    [Weight] decimal(19,9) NULL,
    [NumLowestGradesToDrop] int NULL,
    [NumHighestGradesToDrop] int NULL,
    [WeightDistributionType] varchar(8) NULL,
    [CreatedDate] datetime2 NULL,
    [ToolName] nvarchar(50) NULL,
    [AssociatedToolItemId] bigint NULL,
    [LastModified] datetime2 NULL,
    [ShortName] nvarchar(128) NULL,
    [GradeObjectTypeId] int NULL,
    [SortOrder] int NULL,
    [IsDeleted] bit NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedByUserId] int NULL,
    [ResultId] int NULL,
    [ToolId] int NULL,
    [Version] int NULL
);
