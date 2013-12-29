/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Enable CLR 
EXEC SP_CONFIGURE 'show advanced options' , '1'
GO
RECONFIGURE
GO
EXEC SP_CONFIGURE 'clr enabled' , '1'
GO
RECONFIGURE
GO
EXEC SP_CONFIGURE 'show advanced options' , '0';
GO

--IF EXISTS (SELECT NAME FROM SYSOBJECTS     WHERE NAME = 'TABLEUDF' ) DROP FUNCTION [DBO].[TABLEUDF] 
--IF EXISTS (SELECT NAME FROM SYSOBJECTS     WHERE name = 'ScalarUDF') DROP FUNCTION [dbo].[ScalarUDF]

---- Don't seem to need this but may well be required if we had to use an F# assembly.
----IF EXISTS (SELECT NAME FROM SYS.ASSEMBLIES WHERE name = 'UDF_Blog' ) DROP ASSEMBLY [UDF_Blog]
--GO

