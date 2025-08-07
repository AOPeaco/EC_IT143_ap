/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s2_ap.sql
PURPOSE: Step 2 of 6 - Add column to track who last modified the row.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Added LastModifiedBy column to the table.
***********************************************************************************
*/

ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedBy VARCHAR(50) NULL;