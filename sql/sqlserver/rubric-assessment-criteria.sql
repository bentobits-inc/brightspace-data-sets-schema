-- Rubric Assessment Criteria
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
IF OBJECT_ID(N'[dbo].[RubricAssessmentCriteria]', N'U') IS NULL
CREATE TABLE [dbo].[RubricAssessmentCriteria] (
    [AssessmentId] bigint NULL,
    [RubricId] bigint NULL,
    [Score] decimal(19,9) NULL,
    [Feedback] nvarchar(4000) NULL,
    [IsScoreOverridden] bit NULL,
    [CriterionId] bigint NULL,
    [LevelAchievedId] bigint NULL,
    [Version] bigint NULL
);
