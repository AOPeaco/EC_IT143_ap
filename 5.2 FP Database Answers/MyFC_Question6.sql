/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_myfc_q6_salary_trends.sql
PURPOSE: Track salary history for each player over time.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   
RUNTIME:
Xm Xs
NOTES:
This script retrieves each player's salary over time using tblPlayerFact and tblPlayerDim.
***********************************************************************************
*******************************/
-- Q6: How has each player's salary changed over the last several months?
-- A6: This query returns salary by player and date.
SELECT 
  pd.pl_name,
  pf.as_of_date,
  pf.mtd_salary
FROM 
  dbo.tblPlayerFact AS pf
JOIN dbo.tblPlayerDim AS pd ON pf.pl_id = pd.pl_id
ORDER BY 
  pd.pl_name, pf.as_of_date;