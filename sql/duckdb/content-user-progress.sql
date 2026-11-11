-- Content User Progress
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): ContentObjectId, UserId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ContentObjectId -> ContentObjects.ContentObjectId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "ContentUserProgress" (
    "ContentObjectId" INTEGER,
    "UserId" INTEGER,
    "CompletedDate" TIMESTAMP,
    "LastVisited" TIMESTAMP,
    "IsRead" BOOLEAN,
    "NumRealVisits" INTEGER,
    "NumFakeVisits" INTEGER,
    "TotalTime" BIGINT,
    "IsVisited" BOOLEAN,
    "IsCurrentBookmark" BOOLEAN,
    "IsSelfAssessComplete" BOOLEAN,
    "LastModified" TIMESTAMP,
    "Version" BIGINT
);
