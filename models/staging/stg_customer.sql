select
    customer_name,
    city,
    city_id,
    customer_id
from (
    select
        customer_name,
        city,
        city_id,
        customer_id,
        row_number() over (partition by customer_id order by customer_name) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_customers
order by customer_id
