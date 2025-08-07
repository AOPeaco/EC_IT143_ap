/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s4b_ap.sql
PURPOSE: Step 4 of 6 - Test the LastModifiedDate trigger by performing an update.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Executed update to trigger the LastModifiedDate.
***********************************************************************************
*/

UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName + ' '
WHERE CustomerID = 2;