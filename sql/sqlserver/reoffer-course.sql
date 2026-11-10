-- Reoffer Course
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): CourseOfferingId, SourceCourseId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
IF OBJECT_ID(N'[dbo].[ReofferCourse]', N'U') IS NULL
CREATE TABLE [dbo].[ReofferCourse] (
    [CourseOfferingId] int NULL,
    [SourceCourseId] int NULL,
    [CreatedBy] int NULL,
    [ReofferDate] datetime2 NULL
);
