select
    
        stg_customer.customer_id,
        stg_customer.customer_name,
        stg_customer.city,
        stg_city.city_id
from {{ ref('stg_customer') }}
left join {{ ref('stg_city') }} on stg_customer.city_id = stg_city.city_id


