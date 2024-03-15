{{ config(materialized='table') }}

SELECT *
FROM raw_data.emp_stg
QUALIFY ROW_NUMBER() OVER (PARTITION BY empid ORDER BY inserted_at DESC) = 1