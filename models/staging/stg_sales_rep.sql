select
    sales_rep_name,
    sales_rep_id,
    sales_team_id
from (
    select
        sales_rep_name,
        sales_rep_id,
        sales_team_id,
        row_number() over (partition by sales_rep_id order by sales_rep_name) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_sales_rep
order by sales_rep_id