-- Question Pools
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SectionId, QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
DROP TABLE IF EXISTS [dbo].[QuestionPools];
CREATE TABLE [dbo].[QuestionPools] (
    [SectionId] bigint NULL,
    [QuestionId] bigint NULL,
    [QuestionVersionId] bigint NULL,
    [IsDeleted] bit NULL,
    [Version] bigint NULL
);
