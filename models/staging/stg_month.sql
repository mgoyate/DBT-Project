with source as (

    select * from {{ ref('pharma_with_id') }}

),

renamed as (

    select
        distinct month_id,
        month

    from source

)

select * from renamed

order by month_id 