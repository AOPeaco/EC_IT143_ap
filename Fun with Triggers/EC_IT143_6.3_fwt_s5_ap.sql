/*
***********************************************************************************
NAME: EC_IT143_6.3_lmb_s5_ap.sql
PURPOSE: Step 5 of 6 - Verify updated column for LastModifiedBy.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Verified SYSTEM_USER is being recorded.
***********************************************************************************
*/

SELECT CustomerID, ContactName, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;