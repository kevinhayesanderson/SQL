SELECT *
FROM dbo.Orders;
--Not suitable for large tables

SELECT
    OrderId
FROM
    dbo.Orders;
------------------------------------
SELECT
    OrderId,
    ShipCity
FROM
    dbo.Orders;
------------------------------------
SELECT TOP(5)
    OrderId
FROM dbo.Orders;

SELECT TOP(5) PERCENT
    OrderId
FROM dbo.Orders;

SELECT
    TOP (50) PERCENT
    *
FROM
    dbo.Orders;
------------------------------------
SELECT DISTINCT ShipCountry
FROM dbo.Orders;

------------------------------------
SELECT DISTINCT ShipCountry AS Country
FROM dbo.Orders;

------------------------------------
SELECT TOP(10)
    OrderId,
    OrderDate
FROM dbo.Orders
ORDER BY OrderDate, OrderId;
--asc order

SELECT TOP(50)
    OrderId,
    CustomerId,
    ShipCountry
FROM dbo.Orders
ORDER BY ShipCountry, OrderId DESC;

SELECT TOP(50)
    OrderId,
    CustomerId,
    ShipCountry
FROM dbo.Orders
ORDER BY ShipCountry DESC, OrderId DESC;
------------------------------------
SELECT
    OrderId,
    CustomerId,
    ShipCountry,
    Freight
FROM dbo.Orders
WHERE Freight > 30
ORDER BY Freight;

SELECT
    OrderId,
    CustomerId,
    ShipCountry,
    Freight
FROM dbo.Orders
WHERE Freight > 30 AND ShipCountry = 'USA'
ORDER BY Freight;

SELECT
    OrderId,
    CustomerId,
    ShipCountry,
    Freight
FROM dbo.Orders
WHERE Freight > 30 AND ShipCountry <> 'USA'
ORDER BY Freight;

SELECT
    OrderId,
    CustomerId,
    ShipCountry,
    Freight
FROM dbo.Orders
WHERE Freight BETWEEN 30 AND 100 AND ShipCountry <> 'USA'
--inclusive range
ORDER BY Freight;

SELECT
    OrderId,
    CustomerId,
    ShipCountry,
    Freight
FROM dbo.Orders
WHERE Freight NOT BETWEEN 30 AND 100 AND ShipCountry <> 'USA'
ORDER BY Freight DESC;

SELECT TOP(5)
    OrderId,
    CustomerId,
    ShipCountry,
    Freight,
    ShipRegion
FROM dbo.Orders
WHERE ShipRegion IS NULL;

SELECT TOP (100)
    orderid,
    customerid,
    shipcountry,
    freight,
    shipregion
FROM
    dbo.orders
WHERE 
    shipregion IS NOT NULL
    AND freight > 100
    OR freight < 30
ORDER BY 
    freight DESC, 
    orderid DESC;
--will have null ShipRegion, becoz OR is two sets of conditions

--below two query are same but or condition syntax change for common condition
SELECT TOP (100)
    orderid,
    customerid,
    shipcountry,
    freight,
    shipregion
FROM
    dbo.orders
WHERE 
    shipregion IS NOT NULL
    AND (
        freight > 100
    OR freight < 30)
ORDER BY 
    freight DESC, 
    orderid DESC;

SELECT TOP (100)
    orderid,
    customerid,
    shipcountry,
    freight,
    shipregion
FROM
    dbo.orders
WHERE 
    (
    shipregion IS NOT NULL
    AND freight > 100
    )
    OR
    (
    shipregion IS NOT NULL
    AND freight < 30
    )
ORDER BY 
    freight DESC,
    shipregion, 
    orderid DESC;

SELECT TOP (100)
    orderid,
    customerid,
    shipcountry,
    freight,
    shipregion
FROM
    dbo.orders
WHERE
    shipRegion IN ('SP','ID','WA')

SELECT TOP (100)
    orderid,
    customerid,
    shipcountry,
    freight,
    shipregion
FROM
    dbo.orders
WHERE
    shipRegion LIKE 'A%';