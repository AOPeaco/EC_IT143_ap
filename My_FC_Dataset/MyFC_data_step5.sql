/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s5_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 5 of 9 - Create a table from the view
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script creates a physical table from the view using SELECT INTO.
*/
DROP TABLE IF EXISTS tbl_avg_salary_by_position;

SELECT * 
INTO tbl_avg_salary_by_position
FROM vw_avg_salary_by_position;