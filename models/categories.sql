SELECT 
    category_id, 
    category_name,
    description
FROM {{source('sources','categories')}}