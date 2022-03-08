{{ config(materialized='ephemeral') }}
--- add timestampsand time  columns to waiting table then create new timestamps column which time zone is UTC,then calculate duration of each id per hour
with cte as(select station,
                   minute,
                   hour,
                   Date,
                   Id_Wt,
                   Duration,
                   cast(CONCAT(Date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))+':'+00) as datetime)as Timestamps,
                   cast(Timestamps AS time) as Time,
                   convert_timezone('America/New_York','UTC', Timestamps) AS utc_timestamp  
            from {{ ref('int_idwt2' )}})
---rename columns
select date,
       utc_timestamp,
       hour,
       minute,
       id_wt as chair_id,
       duration,
       station 
from cte order by date,hour,Id_Wt