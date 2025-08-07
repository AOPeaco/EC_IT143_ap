/*
***********************************************************************************
NAME: EC_IT143_6.3_lmb_s3_ap.sql
PURPOSE: Step 3 of 6 - Create AFTER UPDATE trigger to populate LastModifiedBy.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Created update trigger to log username.
***********************************************************************************
*/

CREATE OR ALTER TRIGGER trg_Update_LastModifiedBy
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastModifiedBy = SYSTEM_USER
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID
    WHERE ISNULL(c.LastModifiedBy, '') = ISNULL(i.LastModifiedBy, '');
END;