-- Discussion Topics
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionTopics" (
    "OrgUnitId" INTEGER,
    "TopicId" BIGINT,
    "ForumId" BIGINT,
    "Name" VARCHAR,
    "Description" VARCHAR,
    "MustPostToParticipate" BOOLEAN,
    "AllowAnon" BOOLEAN,
    "IsHidden" BOOLEAN,
    "RequiresApproval" BOOLEAN,
    "LastPostDate" TIMESTAMP,
    "LastPostUserId" BIGINT,
    "NumViews" BIGINT,
    "SortOrder" INTEGER,
    "IsDeleted" BOOLEAN,
    "DeletedDate" TIMESTAMP,
    "DeletedByUserId" INTEGER,
    "GradeItemId" INTEGER,
    "ScoreOutOf" DOUBLE,
    "ScoreCalculationMethod" VARCHAR,
    "IncludeNonScoredValues" BOOLEAN,
    "Version" BIGINT,
    "ResultId" INTEGER,
    "StartDate" TIMESTAMP,
    "StartDateAvailabilityType" SMALLINT,
    "EndDate" TIMESTAMP,
    "EndDateAvailabilityType" SMALLINT,
    "AIUtilization" INTEGER,
    "DueDate" TIMESTAMP
);
