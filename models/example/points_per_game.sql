{{
    config(
        schema='public',
        materialized ='incremental',
        incremental_strategy ='merge',
        unique_key='season', 
        on_schema_change='append_new_columns')
}}

with firstTable as (
select year(game_date_est) as season,round(avg(pts_away+pts_away),2) as avg_point_scored 
from {{source ('NBA_RAW_DATA','line_score')}}
group by all
), secondTable as (
select year(game_date_est) as season, sum(case when pts_home > pts_away then 1 else 0 end) as total_home_wins 
from {{source ('NBA_RAW_DATA','line_score')}}
group by all
), finalTable as(select firstTable.*, secondTable.total_home_wins from firstTable left join secondTable using(season) )
select * from finalTable

{% if  is_incremental()%}
where season >= (select MAX(season) from {{this}})
{% endif %}