/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s6_ap.sql
PURPOSE: Step 6 of 8 - Compare results of scalar function and ad hoc query.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Compared UDF output with previous ad hoc logic.
RUNTIME: Seconds
***********************************************************************************
*/

SELECT 
    ContactName,
    dbo.fn_GetFirstName(ContactName) AS FirstName_FromUDF,
    SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName_AdHoc
FROM dbo.t_w3_schools_customers;