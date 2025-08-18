{{
    config(
       materialized ='view')
}} 

select s.year,player,tm as team, g as total_games, pts as total_points  
from {{source ('NBA_RAW_DATA','SEASONS_STATS')}}  as s