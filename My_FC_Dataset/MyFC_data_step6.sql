/*
***********************************************************************************
NAME: EC_IT143_W4.2_myfc_s6_ap.sql
QUESTION: What is the average salary per player per position?
PURPOSE: Step 6 of 9 - Refine the table structure
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   07/22/2025  AP       Initial creation
***********************************************************************************
RUNTIME:
Xm Xs
NOTES:
This script drops and recreates the table with proper data types and constraints.
*/
DROP TABLE IF EXISTS tbl_avg_salary_by_position;

CREATE TABLE tbl_avg_salary_by_position (
    PositionName VARCHAR(50) NOT NULL,
    mtd_salary INT NOT NULL
);