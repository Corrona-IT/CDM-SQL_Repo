USE [Reporting]
GO
/****** Object:  View [MS700].[v_op_CorronaDB_Logs]    Script Date: 8/28/2023 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [MS700].[v_op_CorronaDB_Logs] AS

SELECT MAX(LoadFinished) AS DataAsOf --select * 
FROM [RCC_Logs].[dbo].[loadLog] WHERE StagingDataBase = 'RCC_MS700'





GO
