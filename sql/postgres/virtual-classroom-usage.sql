-- Virtual Classroom Usage
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" integer,
    "CourseName" varchar(255),
    "MeetingId" varchar(36),
    "MeetingName" varchar(255),
    "CreationUserId" integer,
    "CreationDate" timestamp,
    "ScheduledDate" timestamp,
    "ScheduledDuration" integer,
    "IsPublished" boolean,
    "ExternalLinksEnabled" boolean,
    "WholeClassInvited" boolean,
    "IsCancelled" boolean,
    "StartDateTime" timestamp,
    "EndDateTime" timestamp,
    "IsRecorded" boolean
);
