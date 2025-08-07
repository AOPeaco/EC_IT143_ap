/*
***********************************************************************************
NAME: EC_IT143_6.3_lmb_s4_ap.sql
PURPOSE: Step 4 of 6 - Test trigger for LastModifiedBy field.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Performed update to see if trigger works.
***********************************************************************************
*/

UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;