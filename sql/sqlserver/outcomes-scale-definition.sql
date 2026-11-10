-- Outcomes Scale Definition
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ScaleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[OutcomesScaleDefinition]', N'U') IS NULL
CREATE TABLE [dbo].[OutcomesScaleDefinition] (
    [ScaleId] uniqueidentifier NULL,
    [Name] nvarchar(1000) NULL,
    [IsDefault] bit NULL,
    [UsePercentages] bit NULL,
    [CreatedDate] datetime2 NULL,
    [CreatedBy] int NULL,
    [LastModifiedDate] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [AchievementThreshold] uniqueidentifier NULL
);
