/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s3_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 3 of 9 - Join fact and dimension tables
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script joins player fact and dimension tables to align salaries with positions.
*/
SELECT 
    p.p_name AS PositionName, 
    f.mtd_salary
FROM dbo.tblPlayerFact f
JOIN dbo.tblPlayerDim d ON f.pl_id = d.pl_id
JOIN dbo.tblPositionDim p ON d.p_id = p.p_id;