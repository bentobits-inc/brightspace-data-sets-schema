-- User Attribute Values
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): UserId, AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AttributeId -> UserAttributeDefinitions.AttributeId
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[UserAttributeValues]', N'U') IS NULL
CREATE TABLE [dbo].[UserAttributeValues] (
    [UserId] int NULL,
    [AttributeId] nvarchar(128) NULL,
    [Value] nvarchar(4000) NULL,
    [LastModified] datetime2 NULL,
    [ModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] int NULL
);
