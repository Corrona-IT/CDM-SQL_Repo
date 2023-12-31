USE [Reporting]
GO
/****** Object:  Table [IBD600].[t_op_drugreference]    Script Date: 9/5/2023 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IBD600].[t_op_drugreference](
	[EnrollmentDateStart] [date] NULL,
	[EnrollmentDateEnd] [date] NULL,
	[DrugCohort_DrugType] [nvarchar](255) NULL,
	[DrugName] [nvarchar](255) NULL,
	[Diagnosis] [nvarchar](255) NULL
) ON [PRIMARY]
GO
