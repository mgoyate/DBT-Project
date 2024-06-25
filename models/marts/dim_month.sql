select
    
    stg_month.month_id,
    stg_month.month
from {{ ref('stg_month') }}
    