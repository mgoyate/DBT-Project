select
    
        stg_city.city_id,
        stg_city.city,
        stg_city.longitude,
        stg_city.latitude,
        stg_country.country_id
from {{ ref('stg_city') }}
left join {{ ref('stg_country') }} on stg_city.country_id = stg_country.country_id