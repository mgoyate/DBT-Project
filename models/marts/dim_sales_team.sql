select
    
        stg_sales_team.manager_name,
        stg_sales_team.sales_team,
        stg_sales_team.sales_team_id
from {{ ref('stg_sales_team') }}
    