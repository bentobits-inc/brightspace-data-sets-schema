-- Quiz Survey Sections
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Snowflake (current).

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizSurveySections" (
    "CollectionId" BIGINT,
    "SectionId" BIGINT,
    "Name" VARCHAR(256),
    "NameIsDisplayed" BOOLEAN,
    "IsQuestionPool" BOOLEAN,
    "SectionText" VARCHAR(1000),
    "SectionTextIsHTML" BOOLEAN,
    "IsSectionTextHidden" BOOLEAN,
    "QuestionPoints" NUMBER(19,9),
    "NumQuestions" INT,
    "NumChoices" INT,
    "Shuffle" BOOLEAN,
    "CreationDate" TIMESTAMP_NTZ,
    "CreatedBy" BIGINT,
    "LastModified" TIMESTAMP_NTZ,
    "LastModifiedBy" BIGINT,
    "IsDeleted" BOOLEAN,
    "Version" BIGINT
);
