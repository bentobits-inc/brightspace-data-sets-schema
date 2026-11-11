-- Course Publisher Launches
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): LaunchId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RecipientId -> CoursePublisherRecipients.RecipientID
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CoursePublisherLaunches" (
    "LaunchId" uuid,
    "OrgUnitId" integer,
    "RecipientId" uuid,
    "UserId" integer,
    "RoleId" integer,
    "LaunchMethod" varchar(256),
    "ExternalUserId" varchar(256),
    "ExternalLMSType" varchar(256),
    "IsNewUser" boolean,
    "LastModified" timestamp
);
