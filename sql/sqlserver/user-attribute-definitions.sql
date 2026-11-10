-- User Attribute Definitions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AttributeId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[UserAttributeDefinitions]', N'U') IS NULL
CREATE TABLE [dbo].[UserAttributeDefinitions] (
    [AttributeId] nvarchar(128) NULL,
    [Name] nvarchar(128) NULL,
    [Type] nvarchar(8) NULL,
    [AllowMultiple] bit NULL,
    [IsDefault] bit NULL,
    [LastModified] datetime2 NULL,
    [ModifiedBy] int NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
