{{ config(materialized='ephemeral') }}
---create timestamps column and filter working hours---
select*,
        cast(CONCAT(Date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
        cast(Timestamps AS time) as Time 
from {{ ref('srcid')}} 
where  (Time >'06:00:00' and Time <'14:30:00')