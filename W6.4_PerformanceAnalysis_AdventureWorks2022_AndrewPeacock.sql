-- Enable stats and execution plan
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Then run this query
SELECT SalesOrderID, ProductID, OrderQty, CarrierTrackingNumber
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98';

-- Create the recommended index
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_CarrierTrackingNumber
ON Sales.SalesOrderDetail (CarrierTrackingNumber);

-- Then run the query again to see the difference

-- I would not run all the commands at the same time, but I'm showing them all together for the deliverable portion of the assignment