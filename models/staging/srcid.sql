{{ config(materialized='ephemeral') }}
---source table for Status tabels(line170)---
---Extract timestamps info(date,hour,minute and second) and rename other columns
select Id_Wip,
       Id_Wt,
       station,
       EXTRACT(HOUR FROM timestamps) AS Hour,
       EXTRACT(MINUTE FROM timestamps) AS Minute,
       EXTRACT(SECOND FROM timestamps) AS Second, 
       DATE(timestamps) as Date          
FROM {{ source('public','pride_cb') }}