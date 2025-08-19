CREATE VIEW vw_SalesSummary_clean
AS
SELECT
    SalesOrderID,
    OrderDate,
    CustomerID,

    CASE 
        WHEN OnlineOrderFlag = 1 THEN N'Online'
        ELSE N'Offline/Reseller' 
    END AS Channel,

    ProductID,
    ProductName,
    ISNULL(Color, N'No Color') AS Color,
    ProductSubcategory,
    ProductCategory,

    OrderQty,
    UnitPrice,
    CAST(OrderQty * UnitPrice AS decimal(19,4)) AS TotalLineAmount,

    YEAR(OrderDate)  AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    YEAR(OrderDate) * 100 + MONTH(OrderDate) AS YearMonthKey,  

    CountryRegionCode
FROM vw_SalesSummary_raw
WHERE ProductCategory IS NOT NULL;   
GO