select season, player_name, team_id, round_pick
from {{source('NBA_RAW_DATA','DRAFT_HISTORY')}}
where round_number=1