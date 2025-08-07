/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s3_ap.sql
PURPOSE: Step 3 of 8 - Ad hoc query to test first name extraction.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Tested first name extraction using SUBSTRING and CHARINDEX.
RUNTIME: Seconds
***********************************************************************************
*/

SELECT 
    ContactName,
    SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS FirstName
FROM dbo.t_w3_schools_customers;