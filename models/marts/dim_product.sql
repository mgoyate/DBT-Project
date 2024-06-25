select
    
    stg_product.product_id,
    stg_product.product_name,
    stg_product.product_class
from {{ ref('stg_product') }}


