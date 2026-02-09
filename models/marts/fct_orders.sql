SELECT
    O.OrderID ,
    O.OrderDate ,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    O.Updated_at,
    COUNT(DISTINCT O.OrderID) AS OrderCount,
    SUM(OI.TotalPrice) AS revenue
FROM
    {{ ref('stg_oms__orders')}} O
JOIN
    {{ ref('stg_oms__orderitems')}} OI ON O.OrderID = OI.OrderID
GROUP BY
    O.OrderID ,
    O.OrderDate ,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    O.Updated_at