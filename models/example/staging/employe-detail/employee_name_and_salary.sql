{{ config(materialized='table', alias='emp12',tags=["new1"])}}

WITH source AS (
    SELECT emp_name, salary
    FROM {{ source('employee-detail', 'employee') }}
)

SELECT *
FROM source
ORDER BY salary DESC
LIMIT 2

