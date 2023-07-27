/*
VERIFICANDO A OCORRENCIA DE REGISTROS DUPLICADOS

SELECT *
FROM {{source('sources','orders')}}
WHERE order_id IS NULL
   OR employee_id IS NULL
   OR order_date IS NULL
*/

SELECT
    order_id, 
    customer_id,
    employee_id,
    order_date,
    date_part(day, order_date) AS day_orderdate,
    date_part(month, order_date) AS month_orderdate,
    date_part(year, order_date) AS year_orderdate,
    required_date,
    date_part(day, required_date) AS day_requireddate,
    date_part(month, required_date) AS month_requireddate,
    date_part(year, required_date) AS year_requireddate,    
    shipped_date,
    date_part(day, shipped_date) AS day_shippeddate,
    date_part(month, shipped_date) AS monthshipped_date,
    date_part(year, shipped_date) AS year_shippeddate,
    ship_via,
    freight,
    ship_name,
    ship_address,
    ship_city,
    ship_postal_code,
    ship_country
FROM {{source('sources','orders')}}
