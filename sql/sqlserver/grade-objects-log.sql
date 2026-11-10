-- Grade Objects Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): GradeObjectId -> GradeObjects.GradeObjectId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[GradeObjectsLog]', N'U') IS NULL
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
