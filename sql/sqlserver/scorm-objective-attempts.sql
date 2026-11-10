-- SCORM Objective Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): VisitId, ObjectiveId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ObjectiveId -> SCORMObjectives.ObjectiveId
-- Join (informational): VisitId -> SCORMVisits.VisitId
IF OBJECT_ID(N'[dbo].[SCORMObjectiveAttempts]', N'U') IS NULL
CREATE TABLE [dbo].[SCORMObjectiveAttempts] (
    [VisitId] uniqueidentifier NULL,
    [ObjectiveId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [Score] float(24) NULL,
    [ScoreRaw] float(24) NULL,
    [Success] nvarchar(100) NULL,
    [Completion] nvarchar(100) NULL,
    [Progress] float(24) NULL,
    [LastModified] datetime2 NULL
);
