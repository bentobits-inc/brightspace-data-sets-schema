-- Content User Completion
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserCompletion" (
    "ContentObjectId" integer,
    "OrgUnitId" integer,
    "UserId" integer,
    "DateCompleted" timestamp,
    "LastModified" timestamp,
    "Version" bigint,
    "LastModifiedBy" integer,
    "IsDeleted" boolean,
    "AutomaticDateCompleted" timestamp,
    "ManualDateCompleted" timestamp
);
