USE [Reporting]
GO
/****** Object:  Table [RA100].[t_op_OtherDrugs]    Script Date: 9/5/2023 2:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RA100].[t_op_OtherDrugs](
	[VisitId] [bigint] NULL,
	[SiteID] [int] NULL,
	[SubjectID] [bigint] NULL,
	[VisitType] [nvarchar](30) NULL,
	[VisitDate] [date] NULL,
	[TreatmentName] [nvarchar](300) NULL,
	[SpecifyOther] [nvarchar](300) NULL,
	[ChangesToday] [nvarchar](50) NULL,
	[FirstUseDate] [nvarchar](20) NULL
) ON [PRIMARY]
GO
