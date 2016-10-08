-- for use of establishing linked server connction from linux sql server to windows server
-- 2016-10-06 at the time of writing, SSMS has a bug, linked server cannot be created from linux server to windows server through SSMS
-- must be done through query

USE [master]
GO

/****** Object:  LinkedServer [sunv9]    Script Date: 2016/10/6 下午 01:24:16 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'sunv9', @srvproduct=N'', @provider=N'SQLNCLI', @datasrc=N'192.168.168.2'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'sunv9',@useself=N'False',@locallogin=NULL,@rmtuser=N'sa',@rmtpassword='#######'

GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'sunv9', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO