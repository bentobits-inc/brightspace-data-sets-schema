-- Tools
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ToolId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[Tools];
CREATE TABLE [dbo].[Tools] (
    [ToolId] int NULL,
    [Name] nvarchar(50) NULL,
    [DisplayName] nvarchar(200) NULL,
    [Version] bigint NULL
);
