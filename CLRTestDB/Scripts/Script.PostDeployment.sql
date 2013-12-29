/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
			   SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Create ScalarUDF
CREATE FUNCTION [dbo].[ScalarUDF]()
RETURNS 
	nvarchar(100)
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME UDF_Blog.UserDefinedFunctions.ScalarUDF;
GO

-- Create TableUDF
CREATE FUNCTION [dbo].[TableUDF]()
RETURNS 
	table 
	(
		Sequence INT,
		Text     NVARCHAR(100)
	) 
AS
EXTERNAL NAME UDF_Blog.UserDefinedFunctions.TableUDF;
GO