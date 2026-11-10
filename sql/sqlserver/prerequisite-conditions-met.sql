-- PreRequisite Conditions Met
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): PreRequisiteId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[PreRequisiteConditionsMet];
CREATE TABLE [dbo].[PreRequisiteConditionsMet] (
    [PreRequisiteId] int NULL,
    [UserId] int NULL,
    [DateMet] datetime2 NULL,
    [Action] nvarchar(7) NULL,
    [LastModified] datetime2 NULL
);
