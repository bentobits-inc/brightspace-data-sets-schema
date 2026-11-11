-- Announcements
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AnnouncementId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "Announcements" (
    "AnnouncementId" BIGINT,
    "OrgUnitId" BIGINT,
    "Title" VARCHAR(400),
    "StartDate" TIMESTAMP_NTZ,
    "EndDate" TIMESTAMP_NTZ,
    "IsGlobal" BOOLEAN,
    "IsDraft" BOOLEAN,
    "NumAttachments" INT,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "CreatedBy" INT,
    "IsAuthorInfoShown" BOOLEAN,
    "CreatedDate" TIMESTAMP_NTZ,
    "ResultId" BIGINT
);
