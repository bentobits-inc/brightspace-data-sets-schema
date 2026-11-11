-- Checklist Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ChecklistId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "ChecklistObjects" (
    "ChecklistId" BIGINT,
    "OrgUnitId" INT,
    "Name" VARCHAR(512),
    "Description" VARCHAR(1000),
    "DescriptionIsHtml" BOOLEAN,
    "SharedUserId" INT,
    "DisplayInNewWindow" BOOLEAN,
    "SortOrder" INT,
    "Version" BIGINT,
    "ResultId" INT,
    "DateDeleted" TIMESTAMP_NTZ,
    "DeletedBy" INT
);
