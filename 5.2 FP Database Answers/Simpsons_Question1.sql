/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_q1_active_members.sql
PURPOSE: Show active employee count by department over time using Family_Data.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   
RUNTIME:
Xm Xs
NOTES:
This query counts active employees (Status = 'Active') by department and hire year.
Termination_Date is also considered to ensure employee is still with the company.
***********************************************************************************
*******************************/
-- Q1: How many members are currently active in each department, and how has that changed over time?
-- A1: This returns employee counts grouped by department and hire year.
SELECT 
  Department,
  YEAR(Hire_Date) AS hire_year,
  COUNT(*) AS active_employee_count
FROM 
  dbo.Family_Data
WHERE 
  Status = 'Active'
  AND (Termination_Date IS NULL OR Termination_Date > GETDATE())
GROUP BY 
  Department, YEAR(Hire_Date)
ORDER BY 
  Department, hire_year;