USE [Reporting]
GO
/****** Object:  User [myu]    Script Date: 8/28/2023 11:50:57 AM ******/
CREATE USER [myu] FOR LOGIN [myu] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [myu]
GO
