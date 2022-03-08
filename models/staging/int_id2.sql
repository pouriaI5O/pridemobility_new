{{ config(materialized='ephemeral') }}
---filter out the  break times---
with cte as ( select *,
                      CASE WHEN Time>'08:10:00' and Time <'08:25:00'THEN 0
                           WHEN Time >'10:45:00' and Time <'11:25:00'THEN 0
                           WHEN Time >'12:50:00' and Time <'13:05:00'THEN 0
                           ELSE 1 END AS Break_Filter
              from {{ ref('int_id1')}})
 ---select all columns     
select * from cte where Break_Filter>0