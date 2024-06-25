select
    
    stg_country.country_id,
    stg_country.country
from {{ ref('stg_country') }}
    