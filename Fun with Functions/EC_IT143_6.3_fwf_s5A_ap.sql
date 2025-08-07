/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s5_ap.sql
PURPOSE: Step 5 of 8 - Create a scalar function to return first name.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Created UDF to extract first name from full contact name.
RUNTIME: Seconds
***********************************************************************************
*/

CREATE OR ALTER FUNCTION dbo.fn_GetFirstName (@FullName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN SUBSTRING(@FullName, 1, CHARINDEX(' ', @FullName + ' ') - 1)
END;