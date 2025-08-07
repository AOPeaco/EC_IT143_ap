/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s6b_ap.sql
PURPOSE: Step 6b of 8 - Compare scalar function output with ad hoc query.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Compared ad hoc and UDF result sets.
***********************************************************************************
*/

SELECT 
    ContactName,
    dbo.fn_GetLastName(ContactName) AS LastName_UDF,
    CASE 
        WHEN ContactName IS NOT NULL 
             AND LTRIM(RTRIM(ContactName)) <> '' 
             AND CHARINDEX(' ', ContactName) > 0 
             AND LEN(ContactName) > CHARINDEX(' ', ContactName)
        THEN RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
        ELSE ''
    END AS LastName_AdHoc
FROM dbo.t_w3_schools_customers;