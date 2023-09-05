USE [Reporting]
GO
/****** Object:  View [RA102].[v_op_SiteStatus]    Script Date: 9/5/2023 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [RA102].[v_op_SiteStatus]  AS 

SELECT DISTINCT SITENUM AS [SiteID]
,CASE WHEN ACTIVE='t' THEN 'Active'
 ELSE 'Inactive'
 END AS SiteStatus
FROM MERGE_RA_Japan.DBO.DAT_SITES 
WHERE SITENUM NOT LIKE '9%'
---ORDER BY SITENUM



GO
