/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s2_ap.sql
PURPOSE: Step 2 of 8 - Begin creating an answer by drafting a logical approach.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ---------------------------------------------
1.0   08/06/2025  AP       Outlined the approach to extract the first name.
RUNTIME: Seconds
NOTES: Will use CHARINDEX to find space, and SUBSTRING to extract first name.
***********************************************************************************
*/

-- Plan:
-- Use CHARINDEX to find the space between first and last name.
-- Use SUBSTRING to return the portion before the first space.