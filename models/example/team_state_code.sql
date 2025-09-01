select FULL_NAME,COALESCE(state_mapping.CODE, -1)  as code
from {{source('NBA_RAW_DATA','team')}} 
LEFT JOIN {{ ref('state_mapping') }} USING (STATE)