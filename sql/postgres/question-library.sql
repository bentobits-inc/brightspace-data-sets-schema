-- Question Library
-- Brightspace Data Sets table script, Copyright (c) 2026 BentoBits Inc., licensed under the MIT licence.
-- Schema metadata was transcribed from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31).
-- Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.
-- Target: Postgres 9.1 or later.

-- Primary key (informational, not enforced): QuestionId, QuestionVersionId
-- BDS keys can repeat across differential files, so no constraints are created.
CREATE TABLE IF NOT EXISTS "QuestionLibrary" (
    "QuestionId" bigint,
    "QuestionVersionId" bigint,
    "IsAutoGraded" boolean,
    "TemplateTypeId" integer,
    "QuestionType" varchar(28),
    "Name" varchar(256),
    "Question" varchar(1000),
    "Comment" varchar(1000),
    "AnswerKey" varchar(1000),
    "CreationDate" timestamp,
    "Version" bigint,
    "AllowsAttachments" boolean,
    "AIUtilization" integer
);
