-- Enrollments and Withdrawals
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): LogId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
-- Join (informational): RoleId -> RoleDetails.RoleId
-- Join (informational): UserId -> Users.UserId
CREATE TABLE IF NOT EXISTS "EnrollmentsAndWithdrawals" (
    "LogId" BIGINT,
    "UserId" INT,
    "OrgUnitId" INT,
    "RoleId" INT,
    "Action" VARCHAR(50),
    "ModifiedByUserId" INT,
    "EnrollmentDate" TIMESTAMP_NTZ
);
