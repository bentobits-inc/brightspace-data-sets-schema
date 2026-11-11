-- Quiz Survey Sections
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: DuckDB (current).

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizSurveySections" (
    "CollectionId" BIGINT,
    "SectionId" BIGINT,
    "Name" VARCHAR,
    "NameIsDisplayed" BOOLEAN,
    "IsQuestionPool" BOOLEAN,
    "SectionText" VARCHAR,
    "SectionTextIsHTML" BOOLEAN,
    "IsSectionTextHidden" BOOLEAN,
    "QuestionPoints" DECIMAL(19,9),
    "NumQuestions" INTEGER,
    "NumChoices" INTEGER,
    "Shuffle" BOOLEAN,
    "CreationDate" TIMESTAMP,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP,
    "LastModifiedBy" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);
