-- Outcomes Scale Level Definition
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ScaleLevelId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): ScaleId -> OutcomesScaleDefinition.ScaleId
IF OBJECT_ID(N'[dbo].[OutcomesScaleLevelDefinition]', N'U') IS NULL
CREATE TABLE [dbo].[OutcomesScaleLevelDefinition] (
    [ScaleLevelId] uniqueidentifier NULL,
    [ScaleId] uniqueidentifier NULL,
    [Name] nvarchar(1000) NULL,
    [SortOrder] int NULL,
    [PercentageRangeStart] int NULL,
    [RGB] nvarchar(40) NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL
);
