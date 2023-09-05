USE [Reporting]
GO
/****** Object:  View [PSA400].[v_op_Missingness]    Script Date: 9/5/2023 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =================================================
-- Author:		Kevin Soe
-- Create date: 09/27/2022
-- Description:	Determine critical assesments are missing. 1=Missing 0=Not Missing
-- =================================================

		 --SELECT * FROM
CREATE VIEW [PSA400].[v_op_Missingness] AS

SELECT 
	 VS1.[vID]
	,VS1.[SITENUM] AS [SiteID]
	,VS1.[SUBNUM] AS [SubjectID]
	,VS1.[VISNAME] AS [VisitType]
	,CAST(VS1.[VISITDATE] AS DATE) AS [VisitDate]
	,VS1.[VIR_3_1000_DEC] AS [VisitCode]
	,CASE 
		WHEN [EP4].[TENDER_JTS_68] IS NULL THEN 1
		ELSE 0
	 END AS [TJS]
	,CASE 
		WHEN [EP4].[SWOLLEN_JTS_66] IS NULL THEN 1
		ELSE 0
	 END AS [SJS]
	,CASE 
		WHEN [EP4].[MD_GLOBAL_ASSESS] IS NULL THEN 1
		ELSE 0
	 END AS [PGA]
	,CASE 
		WHEN [EP1].[DX_PA] IS NOT NULL AND [EP4].[MD_PA_ASSESS] IS NULL THEN 1
		WHEN [EP1].[DX_PA] IS NOT NULL AND [EP4].[MD_PA_ASSESS] IS NOT NULL THEN 0
		ELSE NULL
	 END AS [AGA]
	,CASE 
		WHEN [ES3].[PAIN_SEVERITY] IS NULL THEN 1
		ELSE 0
	 END AS [PSV]
	,CASE 
		WHEN [ES3].[PT_PAIN] IS NULL THEN 1
		ELSE 0
	 END AS [PPN] 
	,CASE 
		WHEN [ES3].[PT_SPINE_PAIN] IS NULL THEN 1
		ELSE 0
	 END AS [PSP] 
	,CASE 
		WHEN CAST([ES4].[HEALTH_STATUS_WALKING] AS int) IS NULL AND CAST([ES4].[HEALTH_STATUS_SELFCARE] AS int) IS NULL AND CAST([ES4].[HEALTH_STATUS_ACTIVIES] AS int) IS NULL AND  CAST([ES4].[HEALTH_STATUS_PAIN] AS int) IS NULL AND CAST([ES4].[HEALTH_STATUS_ANX_DEP] AS int) IS NULL AND CAST([ES5].[PT_HEALTH_TODAY] AS int) IS NULL 
		THEN 1
		ELSE 0
	 END AS [EQ5D] 
	,CASE 
		WHEN [EP1].[DX_AS] IS NULL AND [EP1].[DX_AXIAL] IS NULL
		THEN NULL
		WHEN 
		(
		
		([EP1].[DX_AS] IS NOT NULL OR [EP1].[DX_AXIAL] IS NOT NULL) 
		
		AND 
		CAST([ES8].[ASAS_ACTIVITIES] AS int) IS NULL AND CAST([ES8].[ASAS_STAND] AS int) IS NULL AND CAST([ES8].[ASAS_RUN] AS int) IS NULL AND  CAST([ES8].[ASAS_TOILET] AS int) IS NULL 
		AND CAST([ES8].[ASAS_EXHAUSTION] AS int) IS NULL AND CAST([ES8].[ASAS_MOTIVATION] AS int) IS NULL AND CAST([ES8].[ASAS_INTEREST] AS int) IS NULL 
		AND CAST([ES8].[ASAS_PEDAL] AS int) IS NULL AND CAST([ES8].[ASAS_CONTACT] AS int) IS NULL AND CAST([ES8].[ASAS_WALK] AS int) IS NULL AND CAST([ES8].[ASAS_CONCENTRATION] AS int) IS NULL 
		AND CAST([ES8].[ASAS_TRAVEL] AS int) IS NULL AND CAST([ES8].[ASAS_FRUSTRATION] AS int) IS NULL AND CAST([ES8].[ASAS_HAIR] AS int) IS NULL AND CAST([ES8].[ASAS_FINANCIAL] AS int) IS NULL 
		AND CAST([ES8].[ASAS_SLEEP] AS int) IS NULL AND CAST([ES8].[ASAS_DIFFICULTIES] AS int) IS NULL
		
		) 
		THEN 1
		ELSE 0
	 END AS [ASAS] -- SELECT TOP 10 *  
 FROM [MERGE_SPA].[staging].[VS_01] VS1
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[EPRO_01] EP1 ON EP1.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[EPRO_04] EP4 ON EP4.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[ESUB_03] ES3 ON ES3.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[ESUB_04] ES4 ON ES4.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[ESUB_05] ES5 ON ES5.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 (SELECT * FROM [MERGE_SPA].[staging].[ESUB_08] WHERE [PAGENAME] IN ('SUBJECT PROs-SpA/AS', 'Subject Enrollment (8 of 9) V2.0')) ES8 ON ES8.vID = VS1.vID
 WHERE VS1.[VISNAME] LIKE '%Enrollment%'
 AND ISNULL(VS1.[VISITDATE],'')<>''
 AND VS1.[SITENUM] NOT LIKE '%999%'

 UNION

 SELECT 
	 VS1.[vID]
	,VS1.[SITENUM] AS [SiteID]
	,VS1.[SUBNUM] AS [SubjectID]
	,VS1.[VISNAME] AS [VisitType]
	,CAST(VS1.[VISITDATE] AS DATE) AS [VisitDate]
	,VS1.[VIR_3_1000_DEC] AS [VisitCode]
	,CASE 
		WHEN [FP4].[TENDER_JTS_68] IS NULL THEN 1
		ELSE 0
	 END AS [TJS]
	,CASE 
		WHEN [FP4].[SWOLLEN_JTS_66] IS NULL THEN 1
		ELSE 0
	 END AS [SJS]
	,CASE 
		WHEN [FP4].[MD_GLOBAL_ASSESS] IS NULL THEN 1
		ELSE 0
	 END AS [PGA]
	,CASE 
		WHEN [FP1].[DX_PA] IS NOT NULL AND [FP4].[MD_PA_ASSESS] IS NULL THEN 1
		WHEN [FP1].[DX_PA] IS NOT NULL AND [FP4].[MD_PA_ASSESS] IS NOT NULL THEN 0
		ELSE NULL
	 END AS [AGA]
	,CASE 
		WHEN [FS2].[PAIN_SEVERITY] IS NULL THEN 1
		ELSE 0
	 END AS [PSV]
	,CASE 
		WHEN [FS2].[PT_PAIN] IS NULL THEN 1
		ELSE 0
	 END AS [PPN] 
	,CASE 
		WHEN [FS2].[PT_SPINE_PAIN] IS NULL THEN 1
		ELSE 0
	 END AS [PSP] 
	,CASE 
		WHEN CAST([FS3].[HEALTH_STATUS_WALKING] AS int) IS NULL AND CAST([FS3].[HEALTH_STATUS_SELFCARE] AS int) IS NULL AND CAST([FS3].[HEALTH_STATUS_ACTIVIES] AS int) IS NULL AND  CAST([FS3].[HEALTH_STATUS_PAIN] AS int) IS NULL AND CAST([FS3].[HEALTH_STATUS_ANX_DEP] AS int) IS NULL AND CAST([FS4].[PT_HEALTH_TODAY] AS int) IS NULL 
		THEN 1
		ELSE 0
	 END AS [EQ5D] 
	,CASE 
		WHEN [FP1].[DX_AS] IS NULL AND [FP1].[DX_AXIAL] IS NULL
		THEN NULL
		WHEN 
		(
		
		([FP1].[DX_AS] IS NOT NULL OR [FP1].[DX_AXIAL] IS NOT NULL) 
		
		AND 
		CAST([FS7].[ASAS_ACTIVITIES] AS int) IS NULL AND CAST([FS7].[ASAS_STAND] AS int) IS NULL AND CAST([FS7].[ASAS_RUN] AS int) IS NULL AND  CAST([FS7].[ASAS_TOILET] AS int) IS NULL 
		AND CAST([FS7].[ASAS_EXHAUSTION] AS int) IS NULL AND CAST([FS7].[ASAS_MOTIVATION] AS int) IS NULL AND CAST([FS7].[ASAS_INTEREST] AS int) IS NULL 
		AND CAST([FS7].[ASAS_PEDAL] AS int) IS NULL AND CAST([FS7].[ASAS_CONTACT] AS int) IS NULL AND CAST([FS7].[ASAS_WALK] AS int) IS NULL AND CAST([FS7].[ASAS_CONCENTRATION] AS int) IS NULL 
		AND CAST([FS7].[ASAS_TRAVEL] AS int) IS NULL AND CAST([FS7].[ASAS_FRUSTRATION] AS int) IS NULL AND CAST([FS7].[ASAS_HAIR] AS int) IS NULL AND CAST([FS7].[ASAS_FINANCIAL] AS int) IS NULL 
		AND CAST([FS7].[ASAS_SLEEP] AS int) IS NULL AND CAST([FS7].[ASAS_DIFFICULTIES] AS int) IS NULL
		
		) 
		THEN 1
		ELSE 0
	 END AS [ASAS] -- SELECT * 
 FROM [MERGE_SPA].[staging].[VS_01] VS1
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[FPRO_01] FP1 ON FP1.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 (SELECT * FROM [MERGE_SPA].[staging].[FPRO_04] WHERE [PAGENAME] <> 'PROVIDER Infection/Other') FP4 ON FP4.vID = VS1.vID  
 LEFT JOIN -- SELECT TOP 10 * FROM 
 (SELECT * FROM [MERGE_SPA].[staging].[FSUB_02] WHERE [PAGENAME] <> 'SUBJECT Demography-Med Hx') FS2 ON FS2.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[FSUB_03] FS3 ON FS3.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 [MERGE_SPA].[staging].[FSUB_04] FS4 ON FS4.vID = VS1.vID
 LEFT JOIN -- SELECT TOP 10 * FROM 
 (SELECT * FROM [MERGE_SPA].[staging].[FSUB_07] WHERE [PAGENAME] IN ('SUBJECT PROs-SpA/AS', 'Subject Follow-up (7 of 8) V2.0')) FS7 ON FS7.vID = VS1.vID
 WHERE VS1.[VISNAME] LIKE '%Follow%'
 AND ISNULL(VS1.[VISITDATE],'')<>''
 AND VS1.[SITENUM] NOT LIKE '%999%'
GO
