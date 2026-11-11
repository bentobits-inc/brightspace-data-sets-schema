-- Portfolio Evidence Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "PortfolioEvidenceLog" (
    "LogId" VARCHAR(36),
    "ParentObjectId" VARCHAR(36),
    "ObjectId" VARCHAR(36),
    "ObjectType" VARCHAR(40),
    "UserId" INT,
    "OrgUnitId" INT,
    "Action" VARCHAR(16),
    "IsMobile" BOOLEAN,
    "ActionDate" TIMESTAMP_NTZ
);
