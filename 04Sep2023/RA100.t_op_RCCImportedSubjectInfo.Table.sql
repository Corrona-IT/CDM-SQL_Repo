USE [Reporting]
GO
/****** Object:  Table [RA100].[t_op_RCCImportedSubjectInfo]    Script Date: 9/5/2023 2:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RA100].[t_op_RCCImportedSubjectInfo](
	[SiteID] [int] NOT NULL,
	[SubjectID] [bigint] NOT NULL,
	[Imported] [int] NULL
) ON [PRIMARY]
GO
