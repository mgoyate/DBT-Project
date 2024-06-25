with source as (

    select * from {{ ref('pharma_with_id') }}

),

renamed as (

    select
       distinct distributor_id,
       distributor

    from source

)

select * from renamed

order by distributor_id asc