-- Award Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AwardId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[AwardObjects];
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
