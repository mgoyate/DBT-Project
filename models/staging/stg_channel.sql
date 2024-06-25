with channel as (

    select * from {{ ref('pharma_with_id') }}
),
renamed as (

    select 
           distinct channel_id,
            channel
        
    from channel
)

select * from renamed

order by channel_id asc