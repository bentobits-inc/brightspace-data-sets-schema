-- Release Condition Results
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): ResultId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
DROP TABLE IF EXISTS [dbo].[ReleaseConditionResults];
CREATE TABLE [dbo].[ReleaseConditionResults] (
    [ResultId] int NULL,
    [UserId] int NULL,
    [Met] varchar(7) NULL,
    [Version] bigint NULL,
    [DeletedDate] datetime2 NULL
);
