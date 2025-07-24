/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s4_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 4 of 9 - Create a view from the join
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script creates a view to simplify further queries.
*/
DROP VIEW IF EXISTS vw_avg_salary_by_position;
GO

CREATE VIEW vw_avg_salary_by_position AS
SELECT 
    p.p_name AS PositionName, 
    f.mtd_salary
FROM dbo.tblPlayerFact f
JOIN dbo.tblPlayerDim d ON f.pl_id = d.pl_id
JOIN dbo.tblPositionDim p ON d.p_id = p.p_id;