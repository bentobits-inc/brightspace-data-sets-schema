-- Role Details
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: BigQuery (current).

-- Primary key (informational, not enforced): RoleId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS `RoleDetails` (
    `RoleId` INT64,
    `RoleName` STRING(120),
    `Description` STRING(400),
    `IsCascading` BOOL,
    `InClassList` BOOL,
    `ClassListRoleName` STRING(120),
    `ClassListShowGroups` BOOL,
    `ClassListShowSections` BOOL,
    `ClassListDisplayRole` BOOL,
    `AccessInactiveCO` BOOL,
    `HasSpecialAccess` BOOL,
    `AddToCourseOfferingGroups` BOOL,
    `CanBeAutoEnrolledIntoGroups` BOOL,
    `AddToCourseOfferingSections` BOOL,
    `CanBeAutoEnrolledIntoSections` BOOL,
    `AccessPastCourses` BOOL,
    `AccessFutureCourses` BOOL,
    `SortOrder` INT64,
    `ShowInContent` BOOL,
    `ShowInDiscussionAssess` BOOL,
    `ShowInDiscussionStats` BOOL,
    `ShowInGrades` BOOL,
    `ShowInAttendance` BOOL,
    `AllowSelfEnrollInGroups` BOOL,
    `ShowInRegistration` BOOL,
    `ShowInUserProgress` BOOL,
    `RoleAlias` STRING(120),
    `RoleCode` STRING(100),
    `LastModifiedDate` DATETIME,
    `DeletedBy` INT64
);
