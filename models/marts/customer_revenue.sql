SELECT 
ORF.CustomerID, 
C.CustomerName,
SUM(ORF.OrderCount) AS OrderCount,
SUM(ORF.Revenue) AS Revenue
FROM 
    {{ ref('fct_orders')}} ORF
JOIN 
    {{ ref('stg_oms__customers')}} C ON ORF.CustomerID = C.CustomerID
GROUP BY ORF.CustomerID, C.CustomerName