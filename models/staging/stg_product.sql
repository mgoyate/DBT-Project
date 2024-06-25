select
    product_id,
    product_name,
    product_class
from (
    select
        product_id,
        product_name,
        product_class,
        row_number() over (partition by product_id order by product_name) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_product_name
order by product_id
