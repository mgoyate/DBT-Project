select

    stg_channel.channel_id,
    stg_channel.channel
from {{ ref('stg_channel') }}
    