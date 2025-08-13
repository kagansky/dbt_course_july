select year(game_date) SEASON,team_id_home AS TEAM_ID,
SUM(case when WL_HOME='W' THEN 1 ELSE 0 END)/COUNT(WL_HOME) AS WIN_PERCENTAGE
from {{source('NBA_RAW_DATA','game')}}
where year(game_date)>2000
group by ALL