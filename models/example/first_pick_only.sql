select 
    * exclude(player_name)
from {{ref('Win_percentage_draft_picks')}}
    where round_pick is not null
    qualify row_number() over(partition by full_name, season order by round_pick) = 1