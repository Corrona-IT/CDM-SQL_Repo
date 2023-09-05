USE [Reporting]
GO
/****** Object:  View [IBD600].[v_SiteParameter]    Script Date: 9/5/2023 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [IBD600].[v_SiteParameter] as 

select DISTINCT(CAST(SITENUM AS int)) AS SiteID
FROM MERGE_IBD.dbo.DAT_SITES

GO
