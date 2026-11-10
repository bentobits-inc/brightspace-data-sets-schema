-- Brightspace Email Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): MailId, RecipientAddress, RecipientType
-- BDS keys can repeat across differential files, so no constraints are created.
IF OBJECT_ID(N'[dbo].[BrightspaceEmailLog]', N'U') IS NULL
CREATE TABLE [dbo].[BrightspaceEmailLog] (
    [MailId] int NULL,
    [SenderUserId] int NULL,
    [SenderAddress] nvarchar(256) NULL,
    [RecipientAddress] nvarchar(256) NULL,
    [RecipientType] nvarchar(4) NULL,
    [DateTimeSent] datetime2 NULL,
    [Subject] nvarchar(1000) NULL
);
