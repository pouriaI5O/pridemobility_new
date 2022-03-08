{{ config(materialized='ephemeral') }}
---remove  anyNull value from waiting table (where id is null)---
select station,
       1 as t_second,
       Id_Wt,
       Date,
       Hour,
       minute,
       second 
from {{ ref('int_id2')}}
where Id_Wt>0
group by Id_Wt,Date,Hour,minute,second,station
order by Date