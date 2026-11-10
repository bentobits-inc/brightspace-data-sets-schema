-- SCORM Interaction Attempts
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): VisitId, InteractionId, AttemptNumber
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ActivityId -> SCORMActivities.ActivityId
-- Join (informational): InteractionId -> SCORMInteractions.InteractionId
-- Join (informational): VisitId -> SCORMVisits.VisitId
IF OBJECT_ID(N'[dbo].[SCORMInteractionAttempts]', N'U') IS NULL
CREATE TABLE [dbo].[SCORMInteractionAttempts] (
    [VisitId] uniqueidentifier NULL,
    [InteractionId] uniqueidentifier NULL,
    [AttemptNumber] int NULL,
    [ActivityId] uniqueidentifier NULL,
    [Timestamp] datetime2 NULL,
    [Response] nvarchar(1000) NULL,
    [Result] nvarchar(100) NULL,
    [NumericResult] float(24) NULL,
    [TimeSpent] float(24) NULL,
    [LastModified] datetime2 NULL
);
