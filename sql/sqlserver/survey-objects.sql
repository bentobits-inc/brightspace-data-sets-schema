-- Survey Objects
-- Brightspace Data Sets schema compilation, Copyright (c) 2026 BentoBits Inc.,
-- compiled from D2L's public Brightspace Data Sets documentation (snapshot checked on 2026-10-31),
-- licensed under CC BY 4.0. Brightspace is a trademark of D2L Corporation; not affiliated with or endorsed by D2L.

-- Primary key (informational, not enforced): SurveyId
-- BDS keys can repeat across differential files, so no constraints are created.
-- Join (informational): CreatedBy -> Users.UserId
-- Join (informational): LastModifiedBy -> Users.UserId
-- Join (informational): OrgUnitId -> OrganizationalUnits.OrgUnitId
DROP TABLE IF EXISTS [dbo].[SurveyObjects];
CREATE TABLE [dbo].[SurveyObjects] (
    [SurveyId] bigint NULL,
    [SurveyName] nvarchar(1000) NULL,
    [CategoryId] bigint NULL,
    [OrgUnitId] int NULL,
    [Description] nvarchar(1000) NULL,
    [DescriptionEnabled] bit NULL,
    [HasInstantFeedback] bit NULL,
    [IsAnonymous] bit NULL,
    [IsVisible] bit NULL,
    [SubmissionMessage] nvarchar(1000) NULL,
    [Footer] nvarchar(1000) NULL,
    [FooterIsDisplayed] bit NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [DisplayInCalendar] bit NULL,
    [ResultId] bigint NULL,
    [AttemptsAllowed] int NULL,
    [SortOrder] int NULL,
    [CreatedBy] int NULL,
    [IsDeleted] bit NULL,
    [LastModified] datetime2 NULL,
    [LastModifiedBy] int NULL,
    [Version] bigint NULL,
    [CategoryName] nvarchar(256) NULL
);
