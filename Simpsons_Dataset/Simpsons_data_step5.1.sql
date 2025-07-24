/*
***********************************************************************************
NAME: EC_IT143_W4.2_simpsons_s5.1_ap.sql
QUESTION: How many employees report to each manager?
PURPOSE: Step 5 of 9 - Create table from the result
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/23/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script is part of the Week 4.2 activity for the 'simpsons' dataset.
*/

SELECT Manager, COUNT(*) AS EmployeeCount
INTO dbo.EmployeesByManager_Table
FROM dbo.Family_Data
GROUP BY Manager;