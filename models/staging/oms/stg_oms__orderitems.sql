SELECT 
    OrderItemID,
    OrderID,
    ProductID,
    Quantity,
    UnitPrice,
    Updated_at,
    Quantity * UnitPrice AS TotalPrice
FROM
        {{ source('staging','orderitems')}}