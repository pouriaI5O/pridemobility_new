{{ config(
    materialized='table'
)}}
select *,
       convert_timezone('UTC','America/New_York',utc_timestamp) as local_timestamp 
from {{ ref('int_idwip3')}}