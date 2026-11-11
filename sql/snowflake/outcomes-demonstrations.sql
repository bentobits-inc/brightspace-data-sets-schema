-- Outcomes Demonstrations
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesDemonstrations" (
    "DemonstrationId" VARCHAR(36),
    "ExplicitlyEnteredScaleLevelId" VARCHAR(36),
    "AutomaticallyGeneratedScaleLevelId" VARCHAR(36),
    "AlignedObjectType" INT,
    "AlignedObjectId" VARCHAR(1000),
    "OutcomeId" VARCHAR(36),
    "RegistryId" VARCHAR(36),
    "IsPublished" BOOLEAN,
    "AssessedUserId" INT,
    "AssessedDate" TIMESTAMP_NTZ,
    "AssessorUserId" INT,
    "LastModifiedDate" TIMESTAMP_NTZ,
    "LastModifiedBy" INT,
    "IsDeleted" BOOLEAN
);
