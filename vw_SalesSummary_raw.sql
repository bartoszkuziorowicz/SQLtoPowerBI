CREATE VIEW vw_SalesSummary_raw
AS
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.CustomerID,
    soh.OnlineOrderFlag,                 

    sod.ProductID,
    p.Name AS ProductName,
    p.Color,
    
    psc.Name AS ProductSubcategory,      
    pc.Name AS ProductCategory,         

    sod.OrderQty,
    sod.UnitPrice, 

    st.CountryRegionCode AS CountryRegionCode   

FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product AS p
  ON sod.ProductID = p.ProductID
LEFT JOIN Production.ProductSubcategory AS psc
  ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc
  ON psc.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN Sales.SalesTerritory AS st
  ON soh.TerritoryID = st.TerritoryID
WHERE soh.OrderDate >= '2012-01-01';
GO