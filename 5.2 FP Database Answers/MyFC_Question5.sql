/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_myfc_q5_highest_paid_by_position.sql
PURPOSE: Identify the highest paid players per position and track how this changed over time.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   
RUNTIME:
Xm Xs
NOTES:
This query returns the top-paid player(s) per position 
***********************************************************************************
*******************************/
-- Q5: Who are the highest paid players on the team by position? I need to see how this has changed over time.
-- A5: This query selects top earners per position, per date.
WITH RankedSalaries AS (
  SELECT 
    pf.as_of_date,
    pos.p_name AS position_name,
    pd.pl_name,
    pf.mtd_salary,
    RANK() OVER (PARTITION BY pf.as_of_date, pos.p_name ORDER BY pf.mtd_salary DESC) AS salary_rank
  FROM 
    dbo.tblPlayerFact AS pf
  JOIN dbo.tblPlayerDim AS pd ON pf.pl_id = pd.pl_id
  JOIN dbo.tblPositionDim AS pos ON pd.p_id = pos.p_id
)
SELECT 
  as_of_date,
  position_name,
  pl_name,
  mtd_salary
FROM 
  RankedSalaries
WHERE 
  salary_rank = 1
ORDER BY 
  as_of_date, position_name;