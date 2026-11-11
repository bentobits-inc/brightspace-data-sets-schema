-- Role Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "RoleDetails" (
    "RoleId" INT,
    "RoleName" VARCHAR(120),
    "Description" VARCHAR(400),
    "IsCascading" BOOLEAN,
    "InClassList" BOOLEAN,
    "ClassListRoleName" VARCHAR(120),
    "ClassListShowGroups" BOOLEAN,
    "ClassListShowSections" BOOLEAN,
    "ClassListDisplayRole" BOOLEAN,
    "AccessInactiveCO" BOOLEAN,
    "HasSpecialAccess" BOOLEAN,
    "AddToCourseOfferingGroups" BOOLEAN,
    "CanBeAutoEnrolledIntoGroups" BOOLEAN,
    "AddToCourseOfferingSections" BOOLEAN,
    "CanBeAutoEnrolledIntoSections" BOOLEAN,
    "AccessPastCourses" BOOLEAN,
    "AccessFutureCourses" BOOLEAN,
    "SortOrder" INT,
    "ShowInContent" BOOLEAN,
    "ShowInDiscussionAssess" BOOLEAN,
    "ShowInDiscussionStats" BOOLEAN,
    "ShowInGrades" BOOLEAN,
    "ShowInAttendance" BOOLEAN,
    "AllowSelfEnrollInGroups" BOOLEAN,
    "ShowInRegistration" BOOLEAN,
    "ShowInUserProgress" BOOLEAN,
    "RoleAlias" VARCHAR(120),
    "RoleCode" VARCHAR(100),
    "LastModifiedDate" TIMESTAMP_NTZ,
    "DeletedBy" INT
);
