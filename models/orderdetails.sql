

SELECT 
    order_id,
    product_id, 
    unit_price, 
    quantity, 
    discount,
    unit_price * quantity * (1 - discount) AS final_price
FROM {{source('sources','order_details')}}
