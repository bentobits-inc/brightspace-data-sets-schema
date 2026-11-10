-- User Attribute Values
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[UserAttributeValues];
CREATE TABLE [dbo].[UserAttributeValues] (
    [UserId] int NULL,
    [AttributeId] nvarchar(128) NULL,
    [Value] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [ModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] int NULL
);
