-- Rubric Assessment Criteria
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): AssessmentId, CriterionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CriterionId -> RubricObjectCriteria.CriterionId
-- Join (informational): RubricId -> RubricObjects.RubricId
DROP TABLE IF EXISTS [dbo].[RubricAssessmentCriteria];
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
