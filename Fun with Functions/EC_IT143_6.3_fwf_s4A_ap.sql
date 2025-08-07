/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s4_ap.sql
PURPOSE: Step 4 of 8 - Researched and tested the SUBSTRING/CHARINDEX solution.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Documented sources and confirmed test results.
RUNTIME: Seconds
***********************************************************************************
*/

-- Source:
-- https://www.sqlservertutorial.net/sql-server-string-functions/sql-server-substring-function/
-- https://stackoverflow.com/questions/27772027/sql-split-full-name-into-first-name-and-last-name

-- Test repeated from step 3
SELECT 
    ContactName,
    SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS FirstName
FROM dbo.t_w3_schools_customers;