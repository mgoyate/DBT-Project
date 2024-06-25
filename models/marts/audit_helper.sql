{# in dbt Develop #}


{% set old_stg_sales_query %}
select
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
from dbt_project_staging.stg_sales
{% endset %}


{% set new_fact_sales_query %}
select
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
from {{ ref('fact_sales') }}
{% endset %}


{{ audit_helper.compare_queries(
    a_query=old_stg_sales_query,
    b_query=new_fact_sales_query
) }}