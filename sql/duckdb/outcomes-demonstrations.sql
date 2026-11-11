-- Outcomes Demonstrations
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): DemonstrationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "OutcomesDemonstrations" (
    "DemonstrationId" UUID,
    "ExplicitlyEnteredScaleLevelId" UUID,
    "AutomaticallyGeneratedScaleLevelId" UUID,
    "AlignedObjectType" INTEGER,
    "AlignedObjectId" VARCHAR,
    "OutcomeId" UUID,
    "RegistryId" UUID,
    "IsPublished" BOOLEAN,
    "AssessedUserId" INTEGER,
    "AssessedDate" TIMESTAMP,
    "AssessorUserId" INTEGER,
    "LastModifiedDate" TIMESTAMP,
    "LastModifiedBy" INTEGER,
    "IsDeleted" BOOLEAN
);
