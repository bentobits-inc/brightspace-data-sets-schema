-- Quiz Survey Sections
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): SectionId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
CREATE TABLE IF NOT EXISTS "QuizSurveySections" (
    "CollectionId" bigint,
    "SectionId" bigint,
    "Name" varchar(256),
    "NameIsDisplayed" boolean,
    "IsQuestionPool" boolean,
    "SectionText" varchar(1000),
    "SectionTextIsHTML" boolean,
    "IsSectionTextHidden" boolean,
    "QuestionPoints" numeric(19,9),
    "NumQuestions" integer,
    "NumChoices" integer,
    "Shuffle" boolean,
    "CreationDate" timestamp,
    "CreatedBy" bigint,
    "LastModified" timestamp,
    "LastModifiedBy" bigint,
    "IsDeleted" boolean,
    "Version" bigint
);
