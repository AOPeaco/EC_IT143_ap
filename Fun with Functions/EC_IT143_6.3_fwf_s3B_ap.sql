/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s3b_ap.sql
PURPOSE: Step 3b of 8 - Test ad hoc SQL to extract last name.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Built and ran ad hoc logic to get last name.
***********************************************************************************
*/

SELECT 
    ContactName,
    RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS LastName
FROM dbo.t_w3_schools_customers;