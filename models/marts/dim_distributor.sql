select
    
    stg_distributor.distributor_id,
    stg_distributor.distributor
from {{ ref('stg_distributor') }}
    
    