-- Discussion Topics
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): TopicId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): DeletedByUserId -> Users.UserId
-- Join (informational): ForumId -> DiscussionForums.ForumId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "DiscussionTopics" (
    "OrgUnitId" integer,
    "TopicId" bigint,
    "ForumId" bigint,
    "Name" varchar(1000),
    "Description" varchar(1000),
    "MustPostToParticipate" boolean,
    "AllowAnon" boolean,
    "IsHidden" boolean,
    "RequiresApproval" boolean,
    "LastPostDate" timestamp,
    "LastPostUserId" bigint,
    "NumViews" bigint,
    "SortOrder" integer,
    "IsDeleted" boolean,
    "DeletedDate" timestamp,
    "DeletedByUserId" integer,
    "GradeItemId" integer,
    "ScoreOutOf" double precision,
    "ScoreCalculationMethod" varchar(19),
    "IncludeNonScoredValues" boolean,
    "Version" bigint,
    "ResultId" integer,
    "StartDate" timestamp,
    "StartDateAvailabilityType" smallint,
    "EndDate" timestamp,
    "EndDateAvailabilityType" smallint,
    "AIUtilization" integer,
    "DueDate" timestamp
);
