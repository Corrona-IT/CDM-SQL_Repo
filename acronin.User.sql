USE [Reporting]
GO
/****** Object:  User [acronin]    Script Date: 8/28/2023 11:50:57 AM ******/
CREATE USER [acronin] FOR LOGIN [acronin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [acronin]
GO
