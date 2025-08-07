/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s2b_ap.sql
PURPOSE: Step 2 of 6 - Add column to track the last modified date.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Added LastModifiedDate column to the table.
***********************************************************************************
*/

ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedDate DATETIME NULL;