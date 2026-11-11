-- Discussion Forums
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): ForumId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionForums" (
    "OrgUnitId" INT,
    "ForumId" BIGINT,
    "Name" VARCHAR(400),
    "Description" VARCHAR(1000),
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "SortOrder" INT,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "ResultId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP_NTZ,
    "EndDateAvailabilityType" SMALLINT,
    "Version" BIGINT
);
