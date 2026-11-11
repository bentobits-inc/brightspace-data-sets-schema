-- Role Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "RoleDetails" (
    "RoleId" integer,
    "RoleName" varchar(120),
    "Description" varchar(400),
    "IsCascading" boolean,
    "InClassList" boolean,
    "ClassListRoleName" varchar(120),
    "ClassListShowGroups" boolean,
    "ClassListShowSections" boolean,
    "ClassListDisplayRole" boolean,
    "AccessInactiveCO" boolean,
    "HasSpecialAccess" boolean,
    "AddToCourseOfferingGroups" boolean,
    "CanBeAutoEnrolledIntoGroups" boolean,
    "AddToCourseOfferingSections" boolean,
    "CanBeAutoEnrolledIntoSections" boolean,
    "AccessPastCourses" boolean,
    "AccessFutureCourses" boolean,
    "SortOrder" integer,
    "ShowInContent" boolean,
    "ShowInDiscussionAssess" boolean,
    "ShowInDiscussionStats" boolean,
    "ShowInGrades" boolean,
    "ShowInAttendance" boolean,
    "AllowSelfEnrollInGroups" boolean,
    "ShowInRegistration" boolean,
    "ShowInUserProgress" boolean,
    "RoleAlias" varchar(120),
    "RoleCode" varchar(100),
    "LastModifiedDate" timestamp,
    "DeletedBy" integer
);
