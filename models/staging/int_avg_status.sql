{{ config(materialized='ephemeral') }}
--- now take average of count columns per minute ---
select station,
       Date,
       Hour,
       Minute ,
       round(avg(Count_Person)) as Count_Person ,
       round(avg(Count_Wip))as Count_Wip,
       round(avg(Count_Wt))as Count_Wt
from {{ ref('int_avg')}} 
group by station,Date,Hour,Minute
order by Date