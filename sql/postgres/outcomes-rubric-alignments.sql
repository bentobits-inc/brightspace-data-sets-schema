-- Outcomes Rubric Alignments
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): RubricId, CriterionId, OutcomeId, RegistryId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OutcomeId -> OutcomeDetails.OutcomeId
-- Join (informational): RegistryId -> OutcomesSetCourse.RegistryId
CREATE TABLE IF NOT EXISTS "OutcomesRubricAlignments" (
    "RubricId" bigint,
    "CriterionId" bigint,
    "OutcomeId" uuid,
    "RegistryId" uuid,
    "CreatedDate" timestamp,
    "CreatedBy" integer,
    "LastModifiedDate" timestamp,
    "LastModifiedBy" integer,
    "IsDeleted" boolean
);
