USE [Reporting]
GO
/****** Object:  User [nguo]    Script Date: 8/28/2023 11:50:57 AM ******/
CREATE USER [nguo] FOR LOGIN [nguo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nguo]
GO
