/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s7_ap.sql
PURPOSE: Step 7 of 8 - Perform 0 results test for validation.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Tested to confirm UDF functions as expected by returning 0 records.
RUNTIME: Seconds
***********************************************************************************
*/

WITH FirstNames AS (
    SELECT 
        ContactName,
        dbo.fn_GetFirstName(ContactName) AS FirstName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM FirstNames
WHERE FirstName IS NULL OR FirstName = '';