/***********************************************************************************
******************************
NAME: AdventureWorks Reporting Queries
PURPOSE: Answer business and metadata questions using SQL from the AdventureWorks database.
MODIFICATION LOG:
Ver     Date			Author				Description
-----   ----------		------------		--------------------------------------------------
1.0     07/18/2025		Andrew Peacock		Created script to answer 8 questions of increasing complexity.
RUNTIME:
Xm Xs
NOTES:
This script is designed to demonstrate SQL proficiency using the AdventureWorks database. 
It includes marginal, moderate, and complex business questions as well as metadata exploration 
via INFORMATION_SCHEMA views. Each section is commented for clarity and organized for instructional use.
***********************************************************************************
*******************************/

-- ================================================================================
-- Question Type: Business User Questions — Marginal Complexity
-- ================================================================================

-- Q1: How many unique product models are listed in the Production.Product table? - Clarence Makwasha
-- A1: This query counts the number of distinct ProductModelID values in the Product table.
SELECT COUNT(DISTINCT ProductModelID) AS UniqueProductModels
FROM Production.Product;

-- Q2: What is the average selling price of all products listed in the Product table? - Njoke Akondi
-- A2: This query calculates the average ListPrice for all records in the Product table.
SELECT AVG(ListPrice) AS AverageSellingPrice
FROM Production.Product;

-- ================================================================================
-- Question Type: Business User Questions — Moderate Complexity
-- ================================================================================

-- Q3: What is the total sales amount for each product category in 2013? Include the category name and total amount. - Alex Ohuru
-- A3: This query joins product, subcategory, and category tables to calculate total sales per category for 2013.
SELECT 
    pc.Name AS CategoryName,
    SUM(sd.LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderDetail sd
JOIN Sales.SalesOrderHeader sh ON sd.SalesOrderID = sh.SalesOrderID
JOIN Production.Product p ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE YEAR(sh.OrderDate) = 2013
GROUP BY pc.Name
ORDER BY TotalSalesAmount DESC;

-- Q4: What is the average time (in days) between an order being placed and shipped for online customers? - Kalemba Esther
-- A4: This query calculates the average difference between OrderDate and ShipDate for online orders.
SELECT 
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AvgDaysToShip
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 1;

-- ================================================================================
-- Question Type: Business User Questions — Increased Complexity
-- ================================================================================

-- Q5: In Q4 of 2013, we launched a promotional discount campaign. Can you identify which sales territories showed an increase in sales compared to Q3? Also, include the total sales figures for both quarters. - Andrew Peacock
-- A5: This query compares total sales per territory between Q3 and Q4 of 2013 using a CTE.
WITH SalesByQuarter AS (
    SELECT 
        st.Name AS Territory,
        DATEPART(QUARTER, OrderDate) AS Quarter,
        SUM(TotalDue) AS TotalSales
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
    WHERE YEAR(OrderDate) = 2013
    GROUP BY st.Name, DATEPART(QUARTER, OrderDate)
)
SELECT 
    q4.Territory,
    q3.TotalSales AS Q3Sales,
    q4.TotalSales AS Q4Sales
FROM SalesByQuarter q3
JOIN SalesByQuarter q4 ON q3.Territory = q4.Territory
WHERE q3.Quarter = 3 AND q4.Quarter = 4 AND q4.TotalSales > q3.TotalSales;

-- Q6: We’re evaluating the performance of our online sales channel during the 2023 holiday season. I need a breakdown of total sales, number of orders, and average order value for online purchases made in November and December 2023. Please group the results by week and include the top three selling product categories for each week. - Wilvet Palanquet
-- A6: This query returns weekly online sales metrics and the top 3 selling product categories per week.
WITH WeeklySales AS (
    SELECT 
        DATEPART(WEEK, OrderDate) AS WeekNumber,
        COUNT(DISTINCT soh.SalesOrderID) AS NumOrders,
        SUM(soh.TotalDue) AS TotalSales,
        AVG(soh.TotalDue) AS AvgOrderValue
    FROM Sales.SalesOrderHeader soh
    WHERE OnlineOrderFlag = 1
      AND OrderDate >= '2023-11-01' AND OrderDate < '2024-01-01'
    GROUP BY DATEPART(WEEK, OrderDate)
),
TopCategories AS (
    SELECT 
        DATEPART(WEEK, sh.OrderDate) AS WeekNumber,
        pc.Name AS Category,
        SUM(sd.LineTotal) AS TotalCategorySales,
        RANK() OVER (PARTITION BY DATEPART(WEEK, sh.OrderDate) ORDER BY SUM(sd.LineTotal) DESC) AS CategoryRank
    FROM Sales.SalesOrderHeader sh
    JOIN Sales.SalesOrderDetail sd ON sh.SalesOrderID = sd.SalesOrderID
    JOIN Production.Product p ON sd.ProductID = p.ProductID
    JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
    WHERE sh.OnlineOrderFlag = 1
      AND sh.OrderDate >= '2023-11-01' AND sh.OrderDate < '2024-01-01'
    GROUP BY DATEPART(WEEK, sh.OrderDate), pc.Name
)
SELECT 
    ws.WeekNumber,
    ws.NumOrders,
    ws.TotalSales,
    ws.AvgOrderValue,
    tc.Category,
    tc.TotalCategorySales
FROM WeeklySales ws
JOIN TopCategories tc ON ws.WeekNumber = tc.WeekNumber
WHERE tc.CategoryRank <= 3
ORDER BY ws.WeekNumber, tc.TotalCategorySales DESC;

-- ================================================================================
-- Question Type: Metadata Questions — System Information Schema Views
-- ================================================================================

-- Q7: Which views exist in the database that reference the Sales schema? List their names only. - Andrew Peacock
-- A7: This query returns view names from the INFORMATION_SCHEMA that belong to the Sales schema.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'Sales';

-- Q8: What are the names and data types of all columns in the Sales.SalesOrderHeader table? - Nwamaka Chimezie
-- A8: This query retrieves column names and data types from the SalesOrderHeader table using INFORMATION_SCHEMA.
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader'
  AND TABLE_SCHEMA = 'Sales';
