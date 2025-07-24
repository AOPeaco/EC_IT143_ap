/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s8_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 8 of 8 - Perform final analysis (AVG)
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script performs the final aggregation.
*/
SELECT PositionName, AVG(mtd_salary) AS AvgSalary
FROM tbl_avg_salary_by_position
GROUP BY PositionName;