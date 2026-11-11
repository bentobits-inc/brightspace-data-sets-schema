-- Competency Objects
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Databricks Runtime 13.3 LTS or later.

-- Primary key (informational, not enforced): ObjectId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
CREATE TABLE IF NOT EXISTS `CompetencyObjects` (
    `ObjectId` BIGINT,
    `OrgUnitId` INT,
    `Name` STRING,
    `Type` STRING,
    `ReadyForEvaluation` BOOLEAN,
    `Status` STRING,
    `Description` STRING,
    `NeedReevaluation` BOOLEAN,
    `ReevaluationIfAchieved` BOOLEAN,
    `ReevaluationIfNotAchieved` BOOLEAN,
    `AdditionalIdentifier` STRING,
    `IsHidden` BOOLEAN
);
