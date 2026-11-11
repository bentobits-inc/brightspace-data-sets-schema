-- Auditor Relationships Log
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): AuditorId, UserToAuditId, OrgUnitId, ModifiedDate
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): ModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS "AuditorRelationshipsLog" (
    "AuditorId" INTEGER,
    "UserToAuditId" INTEGER,
    "OrgUnitId" INTEGER,
    "Action" VARCHAR,
    "ModifiedBy" INTEGER,
    "ModifiedDate" TIMESTAMP
);
