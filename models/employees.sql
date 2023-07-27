WITH employees_calculated as (
SELECT 
first_name + ' ' +last_name AS full_name,
date_part(year, current_date) - date_part(year, birth_date) AS age,
date_part(day, birth_date) AS day_birthdate,
date_part(month, birth_date) AS month_birthdate,
date_part(year, birth_date) AS year_birthdate,
date_part(year, current_date) - date_part(year, hire_date) AS yearsofservice,
date_part(day, hire_date) AS day_hiredate,
date_part(month, hire_date) AS hire_birthdate,
date_part(year, hire_date) AS year_hiredate
FROM {{source('sources','employees')}}
)
SELECT * FROM employees_calculated