/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s4b_ap.sql
PURPOSE: Step 4b of 8 - Document research and test result logic.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Found examples for splitting full names.
***********************************************************************************
*/

-- Source:
-- https://www.sqlservertutorial.net/sql-server-string-functions/sql-server-right-function/
-- https://stackoverflow.com/questions/27552194/sql-split-full-name-into-first-and-last-name

-- Test repeated from step 3
SELECT 
    ContactName,
    RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS LastName
FROM dbo.t_w3_schools_customers;