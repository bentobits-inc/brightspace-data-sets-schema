-- Virtual Classroom Usage
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): MeetingId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "VirtualClassroomUsage" (
    "OrgUnitId" INTEGER,
    "CourseName" VARCHAR,
    "MeetingId" VARCHAR,
    "MeetingName" VARCHAR,
    "CreationUserId" INTEGER,
    "CreationDate" TIMESTAMP,
    "ScheduledDate" TIMESTAMP,
    "ScheduledDuration" INTEGER,
    "IsPublished" BOOLEAN,
    "ExternalLinksEnabled" BOOLEAN,
    "WholeClassInvited" BOOLEAN,
    "IsCancelled" BOOLEAN,
    "StartDateTime" TIMESTAMP,
    "EndDateTime" TIMESTAMP,
    "IsRecorded" BOOLEAN
);
