/*
 Detectando a presença de registros duplicados (Colunas consideradas: company_name, contact_name)

SELECT company_name, contact_name, COUNT(*)
FROM {{source('sources','customers')}}
GROUP BY company_name, contact_name
HAVING COUNT(*) > 1;
*/

/*
Verificando a ocorrência de missings

SELECT *
FROM {{source('sources','customers')}}
WHERE company_name IS NULL
   OR contact_name IS NULL
   OR address IS NULL
   OR city IS NULL
   OR postal_code IS NULL
   OR country IS NULL
   OR phone IS NULL;
*/

SELECT
    ct.customer_id,
    ct.company_name,
    ct.contact_name,
    ct.address,
    ct.city,
    ct.postal_code,
    ct.country,
    ct.phone,
    CASE WHEN ord.year_orderdate = 1996 THEN 1 ELSE 0 END AS order_1996,
    CASE WHEN ord.year_orderdate = 1997 THEN 1 ELSE 0 END AS order_1997,
    CASE WHEN ord.year_orderdate = 1998 THEN 1 ELSE 0 END AS order_1998
FROM {{source('sources','customers')}} AS ct
LEFT JOIN {{ref('orders')}} AS ord ON ct.customer_id = ord.customer_id
