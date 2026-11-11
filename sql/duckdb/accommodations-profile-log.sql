-- Accommodations Profile Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AccommodatedUserId, OrgUnitId, LastModified
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AccommodationsProfileLog" (
    "AccommodatedUserId" BIGINT,
    "OrgUnitId" BIGINT,
    "QuizTimeLimitMultiplier" DECIMAL(5,2),
    "QuizTimeLimitExtraTime" INTEGER,
    "QuizControlAlwaysAllowRightClick" BOOLEAN,
    "ModifiedBy" BIGINT,
    "LastModified" TIMESTAMP
);
