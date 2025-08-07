/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s7b_ap.sql
PURPOSE: Step 7b of 8 - Zero-results test to validate UDF behavior.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Tested to ensure all last names returned are valid.
***********************************************************************************
*/

WITH LastNames AS (
    SELECT 
        ContactName,
        dbo.fn_GetLastName(ContactName) AS LastName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM LastNames
WHERE LastName IS NULL OR LastName = '';