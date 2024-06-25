{{
    config(
        materialized='ephemeral'
    )
}}

with source as (

    select * from {{ source('snowflake', 'pharma') }}

),

renamed as (
    
  SELECT
    ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS id ,
    distributor ,
    customer_name ,
    city ,
    country ,
    latitude ,
    longitude ,
    channel ,
    sub_channel ,
    product_name ,
    product_class ,
    quantity,
    price ,
    sales ,
    month ,
    year ,
    sales_rep_name ,
    manager_name ,
    sales_team ,
    DENSE_RANK() OVER (ORDER BY customer_name) AS customer_id,
    DENSE_RANK() OVER (ORDER BY DISTRIBUTOR) AS distributor_id,
    DENSE_RANK() OVER (ORDER BY country) AS country_id,
    DENSE_RANK() OVER (ORDER BY city) AS city_id,
    DENSE_RANK() OVER (ORDER BY channel) AS channel_id,
    DENSE_RANK() OVER (ORDER BY month ) AS month_id,
    DENSE_RANK() OVER (ORDER BY sub_channel) AS subchannel_id,
    DENSE_RANK() OVER (ORDER BY product_name) AS product_id,
    DENSE_RANK() OVER (ORDER BY sales_rep_name ) AS sales_rep_id,
    DENSE_RANK() OVER (ORDER BY sales_team ) AS sales_team_id,
    DENSE_RANK() OVER (ORDER BY manager_name ) AS manager_id,
    CURRENT_TIMESTAMP() AS current_timestamp
    
    
    

  FROM pharma
)

select * from renamed
