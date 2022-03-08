{{ config(materialized='ephemeral') }}
---calculate duration(total second)  of each id per minute--- 
select sum(t_second) as duration,
       minute,
       hour,
       Date,
       Id_wip,
       station 
from {{ ref('int_idwip1')}}
group by station,date,hour,minute,Id_wip