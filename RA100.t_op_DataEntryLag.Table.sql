USE [Reporting]
GO
/****** Object:  Table [RA100].[t_op_DataEntryLag]    Script Date: 8/28/2023 11:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RA100].[t_op_DataEntryLag](
	[SiteID] [int] NOT NULL,
	[SubjectID] [bigint] NOT NULL,
	[VisitType] [varchar](250) NULL,
	[VisitDate] [date] NULL,
	[CompletionDate] [date] NULL,
	[DifferenceInDays] [int] NULL,
	[VisitID] [bigint] NULL,
	[AuditID] [bigint] NULL,
	[AuditDate] [datetime] NULL,
	[SignedState] [int] NULL,
	[CompleteState] [int] NULL,
	[InCompleteState] [int] NULL,
	[TrlObjectStateBitMask] [bigint] NULL,
	[LastRefreshDate] [date] NULL
) ON [PRIMARY]
GO
