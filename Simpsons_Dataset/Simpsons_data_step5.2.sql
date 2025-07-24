/*
***********************************************************************************
NAME: EC_IT143_W4.2_simpsons_s5.2_ap.sql
QUESTION: How many employees report to each manager?
PURPOSE: Step 6 of 9 - Refine and recreate table with constraints
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/23/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script is part of the Week 4.2 activity for the 'simpsons' dataset.
*/

DROP TABLE IF EXISTS dbo.EmployeesByManager_Table;

CREATE TABLE dbo.EmployeesByManager_Table (
    Manager NVARCHAR(100) NOT NULL,
    EmployeeCount INT NOT NULL,
    PRIMARY KEY (Manager)
);