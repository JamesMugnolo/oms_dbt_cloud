SELECT 
ORF.CustomerID, 
C.CustomerName,
SUM(ORF.OrderCount) AS OrderCount,
SUM(ORF.Revenue) AS Revenue
FROM 
    {{ ref('orders_fact')}} ORF
JOIN 
    {{ ref('customers_stg')}} C ON ORF.CustomerID = C.CustomerID
GROUP BY ORF.CustomerID, C.CustomerName