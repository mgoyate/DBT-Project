{{
    config(
        materialized='incremental',
        unique_key='id'
        
        
    )
}}
with source as (

    select * from {{ ref('pharma_with_id') }}

),

renamed as (

    select
        id,
        subchannel_id,
        distributor_id,
        month_id,
        sales_rep_id,
        product_id,
        customer_id,
        city_id,
        price,
        quantity,
        sales,
        year

    from source

)

{% if is_incremental() %}
select * from renamed
where id > (select max(id) from {{ this }})
{% else %}
select * from renamed
{% endif %}
order by id asc




