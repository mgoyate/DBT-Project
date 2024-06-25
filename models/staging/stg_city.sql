select
    city_id,
    city,
    country_id,
    latitude,
    longitude
from (
    select
    city_id,
    city,
    country_id,
    latitude,
    longitude,
        row_number() over (partition by city_id order by city) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_city
order by city_id