/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s7_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 7 of 8 - Insert the data back into the refined table
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script inserts data into the refined structure.
*/
INSERT INTO tbl_avg_salary_by_position (PositionName, mtd_salary)
SELECT 
    p.p_name AS PositionName, 
    f.mtd_salary
FROM dbo.tblPlayerFact f
JOIN dbo.tblPlayerDim d ON f.pl_id = d.pl_id
JOIN dbo.tblPositionDim p ON d.p_id = p.p_id;