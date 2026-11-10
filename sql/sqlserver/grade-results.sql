-- Grade Results
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): GradeObjectId, OrgUnitId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[GradeResults];
CREATE TABLE [dbo].[GradeResults] (
    [GradeObjectId] int NULL,
    [OrgUnitId] int NULL,
    [UserId] int NULL,
    [PointsNumerator] decimal(19,9) NULL,
    [PointsDenominator] decimal(19,9) NULL,
    [WeightedNumerator] decimal(19,9) NULL,
    [WeightedDenominator] decimal(19,9) NULL,
    [IsReleased] bit NULL,
    [IsDropped] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [Comments] nvarchar(1000) NULL,
    [PrivateComments] nvarchar(1000) NULL,
    [GradeText] nvarchar(50) NULL,
    [GradeReleasedDate] datetime2 NULL,
    [Version] bigint NULL,
    [IsDeleted] bit NULL
);
