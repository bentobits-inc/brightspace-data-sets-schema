-- Grade Objects Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[GradeObjectsLog];
CREATE TABLE [dbo].[GradeObjectsLog] (
    [LogId] bigint NULL,
    [Name] nvarchar(50) NULL,
    [GradeObjectId] int NULL,
    [UserId] int NULL,
    [GradeSymbolString] nvarchar(50) NULL,
    [PointsDenominator] decimal(19,9) NULL,
    [PointsNumerator] decimal(19,9) NULL,
    [WeightedDenominator] decimal(19,9) NULL,
    [WeightedNumerator] decimal(19,9) NULL,
    [Modified] datetime2 NULL,
    [ModifiedBy] int NULL
);
