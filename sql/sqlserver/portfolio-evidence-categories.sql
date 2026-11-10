-- Portfolio Evidence Categories
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CategoryId, EvidenceId, Group
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CategoryId -> PortfolioCategories.CategoryId
-- Join (informational): EvidenceId -> PortfolioEvidenceObjects.EvidenceId
-- Join (informational): LastModifiedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[PortfolioEvidenceCategories]', N'U') IS NULL
CREATE TABLE [dbo].[PortfolioEvidenceCategories] (
    [CategoryId] uniqueidentifier NULL,
    [EvidenceId] uniqueidentifier NULL,
    [Group] nvarchar(30) NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL
);
