USE [Reporting]
GO
/****** Object:  View [RA100].[dwh_qa_bv_documents]    Script Date: 9/5/2023 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




		 --SELECT * FROM
CREATE VIEW [RA100].[dwh_qa_bv_documents] AS


SELECT * FROM OPENQUERY (REDSHIFT, 'SELECT * FROM corrona_dwh_qa.bv_documents')
GO
