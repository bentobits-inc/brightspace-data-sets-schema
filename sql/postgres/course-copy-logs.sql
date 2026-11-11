-- Course Copy Logs
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): CopyCourseJobId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "CourseCopyLogs" (
    "SourceOrgUnitId" integer,
    "DestinationOrgUnitId" integer,
    "UserId" bigint,
    "Status" varchar(128),
    "StartDate" timestamp,
    "EndDate" timestamp,
    "IsDestinationNew" boolean,
    "CopyProtectedResources" boolean,
    "CopyCourseJobId" bigint,
    "StatusId" integer
);
