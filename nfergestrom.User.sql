USE [Reporting]
GO
/****** Object:  User [nfergestrom]    Script Date: 8/28/2023 11:50:57 AM ******/
CREATE USER [nfergestrom] FOR LOGIN [nfergestrom] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nfergestrom]
GO
