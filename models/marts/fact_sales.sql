select
  
    stg_sales.subchannel_id,
    stg_sales.distributor_id,
    stg_sales.month_id,
    stg_sales.sales_rep_id,
    stg_sales.product_id,
    stg_sales.customer_id,
    stg_sales.city_id,
    stg_sales.price,
    stg_sales.quantity,
    stg_sales.sales,
    stg_sales.year
from {{ ref('stg_sales') }}
   