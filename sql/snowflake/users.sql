-- Users
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): UserId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" INT,
    "UserName" VARCHAR(270),
    "OrgDefinedId" VARCHAR(256),
    "FirstName" VARCHAR(64),
    "MiddleName" VARCHAR(64),
    "LastName" VARCHAR(64),
    "IsActive" BOOLEAN,
    "ExternalEmail" VARCHAR(256),
    "CreationDate" TIMESTAMP_NTZ,
    "Version" BIGINT,
    "OrgRoleId" INT,
    "DateDeleted" TIMESTAMP_NTZ
);
