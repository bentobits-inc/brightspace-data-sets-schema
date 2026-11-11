-- JIT Provisioned Users Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): UserId, Timestamp
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "JITProvisionedUsersLog" (
    "UserId" INT,
    "MappingField" VARCHAR(32),
    "MappingFieldValue" VARCHAR(270),
    "ProviderType" VARCHAR(32),
    "ProviderId" VARCHAR(1024),
    "RoleId" INT,
    "Timestamp" TIMESTAMP_NTZ,
    "Action" VARCHAR(16)
);
