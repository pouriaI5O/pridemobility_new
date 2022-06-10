{{ config(materialized='ephemeral') }}
--source table for id tabels (line160)---
---Extract timestamps info(date,hour,minute and second) and rename other columns---
select  count_wip,count_wt,
         count_person,
         station,
          EXTRACT(HOUR FROM timestamps) AS Hour,
          EXTRACT(MINUTE FROM timestamps) AS Minute,
          EXTRACT(SECOND FROM timestamps) AS Second, 
          DATE(timestamps) as Date
                              
FROM {{ source('public','pride_cb') }}