-- Announcements
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "Announcements" (
    "AnnouncementId" BIGINT,
    "OrgUnitId" BIGINT,
    "Title" VARCHAR,
    "StartDate" TIMESTAMP,
    "EndDate" TIMESTAMP,
    "IsGlobal" BOOLEAN,
    "IsDraft" BOOLEAN,
    "NumAttachments" INTEGER,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "CreatedBy" INTEGER,
    "IsAuthorInfoShown" BOOLEAN,
    "CreatedDate" TIMESTAMP,
    "ResultId" BIGINT
);
