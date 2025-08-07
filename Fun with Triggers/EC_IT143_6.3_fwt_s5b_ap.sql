/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s5b_ap.sql
PURPOSE: Step 5 of 6 - Verify the LastModifiedDate was set correctly.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Verified LastModifiedDate is updating.
***********************************************************************************
*/

SELECT CustomerID, ContactName, LastModifiedDate
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 2;