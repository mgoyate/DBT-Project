select
    manager_name,
    sales_team,
    sales_team_id
from (
    select
        manager_name,
        sales_team,
        sales_team_id,
        row_number() over (partition by sales_team_id order by sales_team) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_team
order by sales_team_id