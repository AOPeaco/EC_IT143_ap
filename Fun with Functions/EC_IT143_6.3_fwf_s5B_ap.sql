/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s5b_ap.sql
PURPOSE: Step 5b of 8 - Create scalar function to extract last name.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Created UDF to return last name from ContactName.
***********************************************************************************
*/

CREATE OR ALTER FUNCTION dbo.fn_GetLastName (@FullName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @spaceIndex INT = CHARINDEX(' ', @FullName);
    DECLARE @result VARCHAR(100);

    IF @spaceIndex > 0 AND LEN(@FullName) > @spaceIndex
        SET @result = RIGHT(@FullName, LEN(@FullName) - @spaceIndex);
    ELSE
        SET @result = '';

    RETURN @result;
END;