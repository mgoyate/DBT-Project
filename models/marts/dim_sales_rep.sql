select
   
        stg_sales_rep.sales_rep_id,
        stg_sales_rep.sales_rep_name,
        stg_sales_team.sales_team_id
from {{ ref('stg_sales_rep') }}
left join {{ ref('stg_sales_team') }} on stg_sales_rep.sales_team_id = stg_sales_team.sales_team_id


