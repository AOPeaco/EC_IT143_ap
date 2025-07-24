/*
***********************************************************************************
NAME: EC_IT143_W4.2_hello_world_s7_ap.sql
PURPOSE: Step 8 of the Hello World T-SQL Answer-Focused Method
MODIFICATION LOG:
Ver   Date       Author   Description
----- ---------- -------- ----------------------------------------------------------
1.0   07/21/2025 AP       Created for IT143 Assignment W4.2
RUNTIME:
Xm Xs
NOTES:
This script is part of a sequence to demonstrate a structured T-SQL data manipulation approach.
***********************************************************************************
*/

-- Step 7: Turn the loading script into a stored procedure
CREATE PROCEDURE sp_LoadStateNames
AS
BEGIN
    TRUNCATE TABLE StateNamesTable;
    INSERT INTO StateNamesTable
    SELECT * FROM vw_StateNames;
END;