{{ config(materialized='ephemeral') }}

---adding Status and Ole_Status  column and filter working hours.Also adding utc timestamps column---
select hour,
       minute,
       date,
       Count_Wt,
       Count_Person,
       Count_Wip,
       station,
       cast(CONCAT(date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
       cast(Timestamps AS time) as Time,
       convert_timezone('America/New_York','UTC', Timestamps)  AS  utc_timestamp ,
CASE WHEN Count_Person > 0 and count_wip>0 THEN 'Productive'
     WHEN Count_Person = 0 and count_wip>0 THEN 'Unproductive'
     WHEN Count_Person > 0 and count_wip=0 THEN 'Downtime'
     ELSE 'Idle' END AS Status,
CASE WHEN Count_Person > 0 and count_wip>0 THEN 'Productive'
     ELSE 'Wast' END AS Ole_Status 
       
from {{ ref('int_avg_status')}}  
where (Time >'06:00:00' and Time <'14:30:00')