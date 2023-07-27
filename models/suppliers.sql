SELECT 
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    postal_code,
    country,
    phone
FROM {{source('sources','suppliers')}}