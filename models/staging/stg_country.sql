with source as (

   select * from {{ ref('pharma_with_id') }}

),

renamed as (

    select
        distinct country_id,
        country

    from source

)

select * from renamed

order by country_id asc