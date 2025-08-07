/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s3b_ap.sql
PURPOSE: Step 3 of 6 - Create AFTER UPDATE trigger to populate LastModifiedDate.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Created update trigger to log last modified timestamp.
***********************************************************************************
*/

CREATE OR ALTER TRIGGER trg_Update_LastModifiedDate
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Exit trigger if nesting level exceeds 1 (i.e., don't recurse)
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE c
    SET LastModifiedDate = GETDATE()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;