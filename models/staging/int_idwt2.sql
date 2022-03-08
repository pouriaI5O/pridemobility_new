{{ config(materialized='ephemeral') }}
---calculate duration(total second)  of each id per minute--- 
select sum(t_second) as duration,
       minute,
       hour,
       Date,
       Id_Wt,
       station 
from {{ ref('int_idwt1')}}
group by station,date,hour,minute,Id_Wt