-- Brightspace Email Log
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[BrightspaceEmailLog];
CREATE TABLE [dbo].[BrightspaceEmailLog] (
    [MailId] int NULL,
    [SenderUserId] int NULL,
    [SenderAddress] nvarchar(256) NULL,
    [RecipientAddress] nvarchar(256) NULL,
    [RecipientType] nvarchar(4) NULL,
    [DateTimeSent] datetime2 NULL,
    [Subject] nvarchar(1000) NULL
);
