{{
    config(
        schema='public',
        materialized ='incremental',
        incremental_strategy ='merge',
        unique_key='season')
}}

select year(game_date_est) as season,round(avg(pts_away+pts_away),2) as avg_point_scored 
from {{source ('NBA_RAW_DATA','line_score')}}
group by all

{% if  is_incremental()%}
where year(game_date_est) >= (select MAX(season) from {{this}})
{% endif %}