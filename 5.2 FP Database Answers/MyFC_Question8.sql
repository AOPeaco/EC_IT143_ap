/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_myfc_q8_players_per_coach.sql
PURPOSE: Analyze players per coach and their average salaries.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   Coach linkage not available; partial implementation
RUNTIME:
Xm Xs
NOTES:
tblPlayerDim includes team ID (t_id), but there is no coach or coach_id in tblTeamDim.
This script shows player count and average salary by team instead.
***********************************************************************************
*******************************/
-- Q8: How many players are managed by each coach, and what is the average salary per coach’s roster?
-- A8: Coach info not in schema. Showing players per team instead.
SELECT 
  td.t_code AS team_code,
  COUNT(DISTINCT pd.pl_id) AS players_on_team,
  AVG(pf.mtd_salary) AS avg_salary
FROM 
  dbo.tblPlayerFact AS pf
JOIN dbo.tblPlayerDim AS pd ON pf.pl_id = pd.pl_id
JOIN dbo.tblTeamDim AS td ON pd.t_id = td.t_id
GROUP BY 
  td.t_code
ORDER BY 
  players_on_team DESC;