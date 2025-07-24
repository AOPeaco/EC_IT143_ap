/*
***********************************************************************************
NAME: EC_IT143_W4.2_hello_world_s4_ap.sql
PURPOSE: Step 4 of the Hello World T-SQL Answer-Focused Method
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

-- Step 4: Turn the ad hoc SQL query into a view
CREATE VIEW vw_StateNames AS
SELECT StateName FROM MyStates;