-- Course Awards
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): AssociationId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): AwardId -> AwardObjects.AwardId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "CourseAwards" (
    "AssociationId" BIGINT,
    "AwardId" BIGINT,
    "OrgUnitId" BIGINT,
    "DateCreated" TIMESTAMP_NTZ,
    "HiddenAward" BOOLEAN,
    "ConditionSetId" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "Credits" NUMBER(9,2),
    "IsAssociated" BOOLEAN,
    "Version" BIGINT
);
