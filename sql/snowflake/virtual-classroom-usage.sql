-- Virtual Classroom Usage
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" INT,
    "CourseName" VARCHAR(255),
    "MeetingId" VARCHAR(36),
    "MeetingName" VARCHAR(255),
    "CreationUserId" INT,
    "CreationDate" TIMESTAMP_NTZ,
    "ScheduledDate" TIMESTAMP_NTZ,
    "ScheduledDuration" INT,
    "IsPublished" BOOLEAN,
    "ExternalLinksEnabled" BOOLEAN,
    "WholeClassInvited" BOOLEAN,
    "IsCancelled" BOOLEAN,
    "StartDateTime" TIMESTAMP_NTZ,
    "EndDateTime" TIMESTAMP_NTZ,
    "IsRecorded" BOOLEAN
);
