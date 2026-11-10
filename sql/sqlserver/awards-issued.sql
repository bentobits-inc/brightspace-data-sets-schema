-- Awards Issued
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): IssuedId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): IssuedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RevokedBy -> Users.UserId
-- Join (informational): UserId -> Users.UserId
IF OBJECT_ID(N'[dbo].[AwardsIssued]', N'U') IS NULL
CREATE TABLE [dbo].[AwardsIssued] (
    [AwardId] bigint NULL,
    [OrgUnitId] bigint NULL,
    [UserId] bigint NULL,
    [IssuedBy] int NULL,
    [IssueDate] datetime2 NULL,
    [ExpiryDate] datetime2 NULL,
    [IssuedId] bigint NULL,
    [Criteria] nvarchar(1000) NULL,
    [Evidence] nvarchar(1000) NULL,
    [RevokedDate] datetime2 NULL,
    [RevokedReason] nvarchar(1000) NULL,
    [RevokedBy] bigint NULL,
    [LastModifiedBy] bigint NULL,
    [LastModifiedDate] datetime2 NULL,
    [Version] bigint NULL,
    [CertificateId] nvarchar(12) NULL
);
