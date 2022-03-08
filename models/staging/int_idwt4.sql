{{ config(materialized='ephemeral') }}
---creating waiting table for line 170---
--- calculating total duration for each unique chair(daily)
select date,
       hour,
       min(utc_timestamp) as utc_timestamp,
       chair_id,
       sum(duration) as duration,
       station 
from  {{ ref('int_idwt3' )}}  group by station,date,chair_id,station,hour