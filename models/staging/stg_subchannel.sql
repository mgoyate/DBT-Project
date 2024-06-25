select
    subchannel_id,
    sub_channel,
    channel_id
from (
    select
        subchannel_id,
    	sub_channel,
    	channel_id,
        row_number() over (partition by subchannel_id order by sub_channel) as row_num
    from {{ source('snowflake', 'pharma_with_id') }}
    qualify row_num = 1
) unique_subchannel
order by subchannel_id
