/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_q2_employees_per_manager.sql
PURPOSE: Determine employee counts per manager using Family_Data.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   
RUNTIME:
Xm Xs
NOTES:
This script shows how many employees report to each manager.
It uses the Manager column from Family_Data and returns average count per manager.
***********************************************************************************
*******************************/
-- Q2: What is the average number of employees assigned to each manager across all departments?
-- A2: Count employees grouped by manager.
SELECT 
  Manager,
  COUNT(*) AS employee_count
FROM 
  dbo.Family_Data
WHERE 
  Manager IS NOT NULL
GROUP BY 
  Manager
ORDER BY 
  employee_count DESC;