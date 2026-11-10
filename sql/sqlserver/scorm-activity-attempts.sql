-- SCORM Activity Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): VisitId, ActivityId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): VisitId -> SCORMVisits.VisitId
IF OBJECT_ID(N'[dbo].[SCORMActivityAttempts]', N'U') IS NULL
CREATE TABLE [dbo].[SCORMActivityAttempts] (
    [VisitId] uniqueidentifier NULL,
    [ActivityId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [Completion] nvarchar(100) NULL,
    [Success] nvarchar(100) NULL,
    [Score] float(24) NULL,
    [ScoreRaw] float(24) NULL,
    [TimeSpent] float(24) NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);
