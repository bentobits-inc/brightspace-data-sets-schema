-- Checklist Completions
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): UserId, ItemId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): ItemId -> ChecklistItemDetails.ItemId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ChecklistCompletions" (
    "UserId" integer,
    "DateCompleted" timestamp,
    "ItemId" bigint,
    "LastModified" timestamp,
    "IsCompleted" boolean,
    "DateDeleted" timestamp,
    "DeletedBy" integer,
    "Version" bigint
);
