select
        
        stg_subchannel.subchannel_id,
        stg_subchannel.sub_channel,
        stg_channel.channel_id
from {{ ref('stg_subchannel') }}
left join {{ ref('stg_channel') }} on stg_subchannel.channel_id = stg_channel.channel_id 

