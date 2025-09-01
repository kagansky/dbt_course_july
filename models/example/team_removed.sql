select * from {{ ref('team_data_s') }} where DBT_VALID_TO IS NOT NULL
