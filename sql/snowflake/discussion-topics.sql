-- Discussion Topics
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionTopics" (
    "OrgUnitId" INT,
    "TopicId" BIGINT,
    "ForumId" BIGINT,
    "Name" VARCHAR(1000),
    "Description" VARCHAR(1000),
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "LastPostDate" TIMESTAMP_NTZ,
    "LastPostUserId" BIGINT,
    "NumViews" BIGINT,
    "SortOrder" INT,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP_NTZ,
    "DeletedByUserId" INT,
    "GradeItemId" INT,
    "ScoreOutOf" FLOAT,
    "ScoreCalculationMethod" VARCHAR(19),
    "IncludeNonScoredValues" BOOLEAN,
    "Version" BIGINT,
    "ResultId" INT,
    "StartDate" TIMESTAMP_NTZ,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP_NTZ,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INT,
    "DueDate" TIMESTAMP_NTZ
);
