{{
    config(
        materialized='table'
    )
}}
select convert_timezone('America/New_York','America/New_York',timestamps) as local_timestamp,
       utc_timestamp,
       hour,
       minute,
       date,
       count_person,
       count_wip,
       count_wt,
       station,
       status,
       ole_status 
FROM {{ ref('int_avg_ole_status')}}