-- Award Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[AwardObjects]', N'U') IS NULL
CREATE TABLE [dbo].[AwardObjects] (
    [AwardId] bigint NULL,
    [Name] nvarchar(256) NULL,
    [AwardTypeId] int NULL,
    [Type] nvarchar(128) NULL,
    [Description] nvarchar(512) NULL,
    [ExpiryCalculationType] nvarchar(128) NULL,
    [ExpiryNotificationType] nvarchar(128) NULL,
    [ExpiryDate] datetime2 NULL,
    [ImagePath] varchar(1000) NULL,
    [CreatedByUserId] bigint NULL,
    [LastModified] datetime2 NULL,
    [IsDeleted] bit NULL,
    [Criteria] nvarchar(1000) NULL
);
