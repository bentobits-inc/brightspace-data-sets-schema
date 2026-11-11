-- Users
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" INTEGER,
    "UserName" VARCHAR,
    "OrgDefinedId" VARCHAR,
    "FirstName" VARCHAR,
    "MiddleName" VARCHAR,
    "LastName" VARCHAR,
    "IsActive" BOOLEAN,
    "ExternalEmail" VARCHAR,
    "CreationDate" TIMESTAMP,
    "Version" BIGINT,
    "OrgRoleId" INTEGER,
    "DateDeleted" TIMESTAMP
);
