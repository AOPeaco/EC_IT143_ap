/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_q4_avg_age_by_department.sql
PURPOSE: Calculate average employee age by department using Birth_Date.
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   07/29/2025 APEACOCK   Written using Family_Data and Birth_Date
RUNTIME:
Xm Xs
NOTES:
Calculates average age by department using Birth_Date and current date.
***********************************************************************************
*******************************/
-- Q4: What is the average age of employees by department?
-- A4: Uses DATEDIFF on Birth_Date to compute age, then averages it by department.
SELECT 
  Department,
  AVG(DATEDIFF(YEAR, Birth_Date, GETDATE())) AS average_age
FROM 
  dbo.Family_Data
WHERE 
  Birth_Date IS NOT NULL
GROUP BY 
  Department
ORDER BY 
  average_age DESC;